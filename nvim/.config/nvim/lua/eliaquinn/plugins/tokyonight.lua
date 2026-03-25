return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "moon", -- dark
			light_style = "day", -- light
			transparent = false,
			terminal_colors = true,
			day_brightness = 0.15, -- reduz o branco forte no modo claro
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
				sidebars = "dark",
				floats = "dark",
			},
		})

		vim.o.background = "dark"
		vim.cmd.colorscheme("tokyonight")
	end,
}
