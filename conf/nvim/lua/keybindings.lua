local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- Paste or replace without overwrite register
map("v", "p", '"_dP', opts)

-- Reset highlight after search
map("n", "<esc>", ":noh <CR>", opts)

-- Toggle file manager
map("n", "<C-f>", ":NvimTreeToggle<CR>", opts)

local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})
