return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = "cd app && npm install",
	keys = {
		{ "gm", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
	},
	config = function()
		vim.g.mkdp_auto_close = true
		vim.g.mkdp_open_to_the_world = false
		vim.g.mkdp_open_ip = "127.0.0.1"
		vim.g.mkdp_echo_preview_url = true

		local function get_browser()
			if vim.fn.has("wsl") == 1 and vim.fn.executable("wslview") == 1 then
				return "wslview"
			elseif vim.fn.executable("brave-browser") == 1 then
				return "brave-browser"
			elseif vim.fn.executable("google-chrome") == 1 then
				return "google-chrome"
			elseif vim.fn.executable("firefox") == 1 then
				return "firefox"
			end
			return nil
		end

		local browser = get_browser()
		if browser then
			vim.g.mkdp_browser = browser
		end
	end,
}
