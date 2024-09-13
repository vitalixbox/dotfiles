local ok, nvimtree = pcall(require, "nvim-tree")
if not ok then
	return
end

local openOnStartup = false
local dirname = vim.fn.argv(0)
if dirname ~= "" then
	if vim.fn.isdirectory(dirname) == 1 then
		openOnStartup = true
	end
else
	openOnStartup = true
end

nvimtree.setup({
	open_on_setup = openOnStartup,
	sort_by = "case_sensitive",
	view = {
		adaptive_size = false,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
	},
})
