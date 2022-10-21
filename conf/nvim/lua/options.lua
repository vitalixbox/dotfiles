local opt = vim.opt
local cmd = vim.cmd

-- disable netrw at the very start of your init.lua (strongly advised for nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.number = true                   -- Show line numbers
opt.history = 1000                  -- Store 1000 items of :cmd history
opt.wrap = false                    -- No newline when line ends

vim.opt.clipboard = "unnamed"       -- MacOS clipboard support

opt.splitright = true               -- Open vertical panels right
opt.splitbelow = true               -- Open horizontal panels below

-- Disable comment for newline after <CR>
cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]

vim.opt.mouse = nil

vim.g.vim_markdown_folding_disabled = 1
