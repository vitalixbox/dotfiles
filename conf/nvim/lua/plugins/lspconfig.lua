local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return
end

local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok then
	return
end

local status_ok, jdtls = pcall(require, "jdtls")
if not status_ok then
	return
end

---------------------------------------------------------------------------------------------------
-- Global key mapping
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
---------------------------------------------------------------------------------------------------

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

---------------------------------------------------------------------------------------------------
-- After LSP starts mappings
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
---------------------------------------------------------------------------------------------------

local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, bufopts)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

local capabilities = cmp_nvim_lsp.default_capabilities()

---------------------------------------------------------------------------------------------------
-- Golang (gopls)
---------------------------------------------------------------------------------------------------

lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

---------------------------------------------------------------------------------------------------
-- Terraform (terraform-ls)
---------------------------------------------------------------------------------------------------

lspconfig.terraformls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*.tf", "*.tfvars" },
	callback = function()
		vim.lsp.buf.format()
	end,
})

---------------------------------------------------------------------------------------------------
-- Lua (lua-ls)
---------------------------------------------------------------------------------------------------

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

---------------------------------------------------------------------------------------------------
-- Python (pyright)
---------------------------------------------------------------------------------------------------

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

---------------------------------------------------------------------------------------------------
-- Kotlin (kotlin-language-server)
---------------------------------------------------------------------------------------------------

lspconfig.kotlin_language_server.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

---------------------------------------------------------------------------------------------------
-- JavaScript / TypeScript (typescript-language-server)
---------------------------------------------------------------------------------------------------

lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-jar",
		"/Users/flatline/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.700.v20231214-2017.jar",
		"-configuration",
		"/Users/flatline/.local/share/nvim/mason/packages/jdtls/config_mac_arm",
		"-data",
		"/Users/flatline/workspace",
	},
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),

	on_attach = on_attach,
	capabilities = capabilities,
}

jdtls.start_or_attach(config)
