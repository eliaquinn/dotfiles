return {
	"barrett-ruth/live-server.nvim",
	build = "npm install -g live-server", -- instala o live-server global
	cmd = { "LiveServerStart", "LiveServerStop" },
	config = function()
		require("live-server").setup({
			port = 5555,
			browser = "default",
		})
	end,
}
