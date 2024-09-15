require "nvchad.options"

local autocmd = vim.api.nvim_create_autocmd

local o = vim.o
-- o.cursorlineopt = "both" -- to enable cursorline!

autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
  end,
})
