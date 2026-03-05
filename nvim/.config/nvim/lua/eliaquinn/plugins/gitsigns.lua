return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "┃" },
			change = { text = "~" },
			delete = { text = "" },
			topdelete = { text = "-" },
			chengedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signs_staged = {
			add = { text = "┃" },
			change = { text = "~" },
			delete = { text = "" },
			topdelete = { text = "-" },
			chengedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		current_line_blame = true,
		word_diff = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol",
			delay = 1000,
			ignore_whitespace = false,
			virt_text_priority = 100,
			use_focus = true,
		},
	},
}
