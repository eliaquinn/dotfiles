return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- bigfile = { enabled = true },
		-- dashboard = { enabled = true },
		-- explorer = { enabled = true },
		indent = { enabled = true },
		-- input = { enabled = true },
		-- picker = { enabled = true },
		notifier = { enabled = true },
		-- quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		-- statuscolumn = { enabled = true },
		-- words = { enabled = true },
		-- toggle = {
		--   enabled = true,
		--   which_key = true,
		-- }
		-- animate = {}
		-- picker = {
		--   sources = {
		--     explorer = {
		--       -- your explorer picker configuration comes here
		--       -- or leave it empty to use the default settings
		--     }
		--   }
		-- }
	},
	keys = {
		{
			"<leader>nm",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},
		-- { "<leader>/",  function() Snacks.picker.grep() end,           desc = "Grep" },
		-- { "<leader>e",  function() Snacks.explorer() end,              desc = "File Explorer" },
		-- { "<leader>sw", function() Snacks.picker.grep_word() end,      desc = "Visual selection or word", mode = { "n", "x" } },
	},
}
