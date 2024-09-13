vim.g.PaperColor_Theme_Options = {
	theme = {
		default = {
			transparent_background = 1,
			override = {
				color05 = { "#ce0010", "102" },
			},
		},
	},
}

vim.api.nvim_command("colorscheme PaperColor")
vim.o.background = "light"
vim.cmd("highlight! link SignColumn LineNr")
