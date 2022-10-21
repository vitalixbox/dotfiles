local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

opt.smartindent = true              -- After <Enter> cursor moves to proper column according language in buffer
opt.expandtab = true                -- Converting tabs to spaces
opt.tabstop = 4                     -- Number of spaces that a <Tab> in the file counts for
opt.shiftwidth = 4                  -- Number of spaces to use for each step of (auto)indent

-- Language specific 2 spaces indent
augroup("setIndent", { clear = true })
autocmd("Filetype", {
  group = "setIndent",
  pattern = {
    "xml", "html", "xhtml", "css", "scss", "javascript", "typescript",
    "yaml", "lua", "tf", "proto"
  },
  command = "setlocal shiftwidth=2 tabstop=2"
})
