-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

print(install_path)

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  })
  vim.o.runtimepath = vim.fn.stdpath("data") .. "/site/pack/*/start/*," .. vim.o.runtimepath
end

-- Plugins
return require("packer").startup{
  function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Theme for interface
    use "rakr/vim-one"
    use "NLKNguyen/papercolor-theme"

    -- Styling bottom bar
    use {
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }
    -- Configurations for Nvim LSP
    use "neovim/nvim-lspconfig"

    -- Explorer
    use {
      "nvim-tree/nvim-tree.lua",
      requires = {
        "nvim-tree/nvim-web-devicons", -- optional, for file icons
      },
      tag = "nightly" -- optional, updated every week. (see issue #1193)
    }

    -- Completion plugin with extensions
    use "hrsh7th/nvim-cmp"              -- Main completion plugin
    use "hrsh7th/cmp-buffer"            -- Buffer completion
    use "hrsh7th/cmp-path"              -- Path completion
    use "hrsh7th/cmp-cmdline"           -- VIM cmd-line completion
    use "hrsh7th/cmp-nvim-lsp"          -- LSP completion
    use "L3MON4D3/LuaSnip"              -- Language snippet support
    use "saadparwaiz1/cmp_luasnip"      -- Luasnip cmd integration
    use "rafamadriz/friendly-snippets"  -- Snippets for different languages

    use "hashicorp/terraform-ls"
    use "hashivim/vim-terraform"

    -- Show help popup with shortcuts
    use "folke/which-key.nvim"

    -- Block comments
    use "terrortylor/nvim-comment"

    -- Find, buffers, etc
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = {
        'nvim-lua/plenary.nvim'
      }
    }

    use "godlygeek/tabular"
    use "preservim/vim-markdown"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require("packer").sync()
    end
  end,
  config = {
    compile_path = require('packer.util').join_paths(vim.fn.stdpath('data'), 'plugin', 'packer_compiled.lua')
  }
}
