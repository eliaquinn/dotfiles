return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			-- Desabilita a compilação/cache que está causando o erro
			compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
			compile = {
				enabled = false, -- Desabilita cache compilado
				path = vim.fn.stdpath("cache") .. "/catppuccin",
			},
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = true,
			},
		})

		-- Carrega o colorscheme com proteção de erro
		local status_ok, err = pcall(vim.cmd.colorscheme, "catppuccin")
		if not status_ok then
			vim.notify("Erro ao carregar Catppuccin: " .. tostring(err), vim.log.levels.WARN)
			-- Fallback para um tema padrão do Neovim
			vim.cmd.colorscheme("default")
		end
	end,
}
