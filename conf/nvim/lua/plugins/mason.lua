local ok, mason = pcall(require, "mason")
if not ok then
	return
end

local ok, masonlspconfig = pcall(require, "mason-lspconfig")
if not ok then
	return
end

mason.setup({})
masonlspconfig.setup({
	ensure_installed = {
		-- lua
		"lua_ls",
		-- python
		"pyright",
		-- terraform
		"terraformls",
		-- golang
		"gopls",
		-- Java
		"jdtls",
		-- Kotlin
		"kotlin_language_server",
		-- TypeScript
		"tsserver",
	},
})
