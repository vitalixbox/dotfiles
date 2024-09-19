require "nvchad.options"

local autocmd = vim.api.nvim_create_autocmd

vim.opt.wrap = false

autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
  end,
})
