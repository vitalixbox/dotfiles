local packer_bootstrap = nil
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local compile_path = require("packer.util").join_paths(vim.fn.stdpath("data"), "plugin", "packer_compiled.lua")

---------------------------------------------------------------------------------------------------
-- Packer plugin manager bootstrap
---------------------------------------------------------------------------------------------------

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	packer_bootstrap = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	vim.o.runtimepath = vim.fn.stdpath("data") .. "/site/pack/*/start/*," .. vim.o.runtimepath
end

---------------------------------------------------------------------------------------------------
-- Plugins
---------------------------------------------------------------------------------------------------

return require("packer").startup({
	function(use)
		-----------------------------------------------------------------------------------------------
		-- Packer can manage itself

		use("wbthomason/packer.nvim")

		-----------------------------------------------------------------------------------------------
		-- Interface

		-- Theme for VIM interface
		use("NLKNguyen/papercolor-theme")

		-- Styling bottom bar
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})

		-----------------------------------------------------------------------------------------------
		-- Language support

		-- Manage LSP servers, DAP servers, linters, and formatters
		use("williamboman/mason.nvim")
		-- Makes easier to use lspconfig with mason.nvim
		use("williamboman/mason-lspconfig.nvim")
		-- Configurations for Nvim LSP
		use("neovim/nvim-lspconfig")

		-- Linting and formatting hooks
		use("jose-elias-alvarez/null-ls.nvim")

		-- Java
		use("mfussenegger/nvim-jdtls")

		-----------------------------------------------------------------------------------------------
		-- Completion

		-- Main completion plugin
		use("hrsh7th/nvim-cmp")

		-- Buffer completion
		use("hrsh7th/cmp-buffer")

		-- Path completion
		use("hrsh7th/cmp-path")

		-- VIM cmd-line completion
		use("hrsh7th/cmp-cmdline")

		-- LSP completion
		use("hrsh7th/cmp-nvim-lsp")

		-- Copilot completion
		use({
			"zbirenbaum/copilot-cmp",
			after = { "copilot.lua" },
			config = function()
				require("copilot_cmp").setup()
			end,
		})

		-----------------------------------------------------------------------------------------------
		-- Snippets

		-- Language snippet support
		use("L3MON4D3/LuaSnip")

		-- Luasnip cmd integration
		use("saadparwaiz1/cmp_luasnip")

		-- Snippets for different languages
		use("rafamadriz/friendly-snippets")

		-----------------------------------------------------------------------------------------------
		-- IDE

		-- Icons pack
		use("nvim-tree/nvim-web-devicons")

		-- Tabs
		use("romgrk/barbar.nvim")

		-- Explorer
		use({
			"nvim-tree/nvim-tree.lua",
			requires = {
				"nvim-tree/nvim-web-devicons",
			},
			tag = "nightly",
		})

		-- Block comments
		use("terrortylor/nvim-comment")

		-- Find, buffers, etc
		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
			requires = {
				"nvim-lua/plenary.nvim",
			},
		})

		-- Diagnostic panel (Quickfix, errors, LSP informations, etc)
		use({
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("trouble").setup({})
			end,
		})

		-- Show Git marks in VIM interface
		use("lewis6991/gitsigns.nvim")

		-- Show git blame
		use("APZelos/blamer.nvim")

		-- Personal Wiki
		use("vimwiki/vimwiki")

		-- Copilot
		use({
			"zbirenbaum/copilot.lua",
			cmd = "Copilot",
			event = "InsertEnter",
			config = function()
				require("copilot").setup({
					suggestion = { enabled = false },
					panel = { enabled = false },
				})
			end,
		})

		-----------------------------------------------------------------------------------------------
		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if packer_bootstrap then
			require("packer").sync()
		end
	end,

	config = {
		compile_path = compile_path,
	},
})
