return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- local treesitter = require("nvim-treesitter.configs")
		-- mudei manualmente dentro de /home/eliaquinn/.local/share/nvim/lazy/nvim-treesitter/lua
		-- o arquivo que era config.lua para configs.lua
		local treesitter = require("nvim-treesitter.config")

		treesitter.setup({
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "terraform" },
				disable = { "tmux" },
			},
			indent = { enable = true },
			autotag = { enable = true },
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"jsx",
				"yaml",
				"html",
				"css",
				"prisma",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"toml",
				"regex",
				"bash",
				"lua",
				"python",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"terraform",
				"vimdoc",
				"c",
				"tmux",
			},
			auto_install = true,
			sync_install = false,
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
