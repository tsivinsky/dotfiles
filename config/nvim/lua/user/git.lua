require("gitsigns").setup({
	signcolumn = true,
	keymaps = {
		noremap = true,

		["n <leader>gs"] = ":Gitsigns stage_hunk<CR>",
		["n <leader>gu"] = ":Gitsigns undo_stage_hunk<CR>",
		["n <leader>gr"] = ":Gitsigns reset_hunk<CR>",
	},
	current_line_blame = true,
	current_line_blame_opts = {
		delay = 1000,
	},
	current_line_blame_formatter_opts = {
		relative_time = true,
	},
})
