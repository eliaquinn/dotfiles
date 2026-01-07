return {
	"nvim-telescope/telescope.nvim",
	-- branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- A correção está aqui: 'build = "make"' compila a extensão nativa.
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move para o resultado anterior
						["<C-j>"] = actions.move_selection_next, -- move para o próximo resultado
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
			pickers = {
				find_files = {
					file_ignore_patterns = { ".git", ".venv" },
					hidden = true,
					no_ignore = true,
				},
				live_grep = {
					-- Adicionado para consistência com find_files
					file_ignore_patterns = { ".git", ".venv" },
					additional_args = function(_)
						return { "--hidden" }
					end,
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Carrega as extensões após o setup
		telescope.load_extension("fzf")
		-- Se você usa o plugin 'noice.nvim', esta linha está correta.
		-- Se não, você pode removê-la para evitar um erro de "extensão não encontrada".
		telescope.load_extension("noice")

		-- Define os atalhos de teclado
		local keymap = vim.keymap -- para concisão

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope registers<cr>", { desc = "Fuzzy find registers" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "[F]ind [K]eymaps" })
		keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "[F]ind [D]iagnostics" })
		keymap.set("n", "<leader><leader>", "<cmd>Telescope buffers<cr>", { desc = "find existing buffers" })
	end,
}
