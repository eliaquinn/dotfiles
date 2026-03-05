return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	event = "BufReadPost",
	config = function()
		-- Recomendado pelo ufo
		vim.o.foldcolumn = "0" -- '0' não mostra coluna de fold
		vim.o.foldlevel = 99 -- mantém aberto por padrão
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		-- Usar expressão de fold do Tree-sitter/LSP via ufo
		vim.o.foldmethod = "expr"
		vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

		-- Keymaps (ajuste se quiser)
		vim.keymap.set("n", "zR", function()
			require("ufo").openAllFolds()
		end, { desc = "UFO: open all folds" })
		vim.keymap.set("n", "zM", function()
			require("ufo").closeAllFolds()
		end, { desc = "UFO: close all folds" })
		vim.keymap.set("n", "zr", function()
			require("ufo").openFoldsExceptKinds()
		end, { desc = "UFO: open folds except kinds" })
		vim.keymap.set("n", "zm", function()
			require("ufo").closeFoldsWith()
		end, { desc = "UFO: close folds with" })

		require("ufo").setup({
			-- Você pode ajustar providers. Ex: { "lsp", "treesitter", "indent" }
			provider_selector = function(_, _, _)
				return { "treesitter", "indent" }
			end,
		})
	end,
}
