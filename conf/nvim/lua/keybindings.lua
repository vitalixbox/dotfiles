local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
local kmap = vim.keymap.set

---------------------------------------------------------------------------------------------------
-- Common
---------------------------------------------------------------------------------------------------

-- Paste or replace without overwrite register
map("v", "p", '"_dP', opts)

-- Reset highlight after search
map("n", "<esc>", ":noh <CR>", opts)

---------------------------------------------------------------------------------------------------
-- UI
---------------------------------------------------------------------------------------------------

-- nvim-tree
local treeapi = require("nvim-tree.api")
map("n", "<A-f>", ":NvimTreeFocus<CR>", opts)
kmap("n", "?", treeapi.tree.toggle_help, opts)

-- telescope
local builtin = require("telescope.builtin")
kmap("n", "ff", builtin.find_files, opts)
kmap("n", "fg", builtin.live_grep, opts)
kmap("n", "fb", builtin.buffers, opts)
kmap("n", "fh", builtin.help_tags, opts)

-- barbar
map("n", "<A-j>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-k>", "<Cmd>BufferNext<CR>", opts)
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)

---------------------------------------------------------------------------------------------------
-- IDE
---------------------------------------------------------------------------------------------------

local jdtls = require("jdtls")
vim.keymap.set("n", "<A-o>", jdtls.organize_imports, {})
-- nnoremap crv <Cmd>lua require('jdtls').extract_variable()<CR>
-- vnoremap crv <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
-- nnoremap crc <Cmd>lua require('jdtls').extract_constant()<CR>
-- vnoremap crc <Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>
-- vnoremap crm <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>
