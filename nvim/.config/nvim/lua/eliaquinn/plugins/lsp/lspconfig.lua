return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.HINT] = "󰰀",
					[vim.diagnostic.severity.INFO] = "",
				},
			},
		})

		local on_attach = function(_, bufnr)
			local opts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		end

		if vim.fn.has("nvim-0.11") == 1 then
			vim.lsp.config.ts_ls = {
				capabilities = capabilities,
				on_attach = on_attach,
			}

			vim.lsp.config.pyright = {
				capabilities = capabilities,
				on_attach = on_attach,
			}

			vim.lsp.config.lua_ls = {
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						diagnostics = { globals = { "vim" } },
						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = { enable = false },
					},
				},
			}

			-- ESLint LSP (diagnósticos + fix)
			vim.lsp.config.eslint = {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					on_attach(client, bufnr)

					-- auto-fix ao salvar (se o server suportar)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							-- tenta aplicar "fix all" do eslint quando disponível
							pcall(vim.cmd, "EslintFixAll")
						end,
					})
				end,
			}

			-- inicia aqui o lsp
			vim.lsp.enable({ "ts_ls", "eslint", "pyright", "lua_ls" })

			return
		end

		-- Fallback para versões antigas (<0.11), se você quiser manter compatibilidade:
		local lspconfig = require("lspconfig")

		lspconfig.tsserver.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.eslint.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
}
