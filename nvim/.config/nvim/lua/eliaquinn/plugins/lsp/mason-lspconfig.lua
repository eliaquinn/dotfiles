return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = { "williamboman/mason.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
	config = function()
		local mason_tool_installer = require("mason-tool-installer")
		local mason = require("mason")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"ts_ls",
				"eslint",
				"html",
				"dockerls",
				"lua_ls",
				"docker_compose_language_service",
				"tflint",
				"jsonls",
				"sqlls",
				"ruff",
				"terraformls",
				"yamlls",
			},
			automatic_installation = true,
		})

		vim.schedule(function()
			mason_tool_installer.setup({
				ensure_installed = {
					"prettier", -- prettier formatter
					"stylua", -- lua formatter
					"isort", -- python formatter
					"black", -- python formatter
					"pylint", -- python linter
					"eslint_d", -- js linter
					"docformatter",
					"djlint", -- Jinja2 linter e formatter
				},
				auto_update = false, -- adicionar esta opção
				run_on_start = true,
			})
		end)
	end,
}
