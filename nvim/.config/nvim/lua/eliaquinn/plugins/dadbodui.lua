return {
	{
		"tpope/vim-dadbod",
		cmd = {
			"DB",
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			local ok, dbs = pcall(require, "local.dbs")
			if ok then
				vim.g.dbs = dbs
			end
		end,
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = { "tpope/vim-dadbod" },
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/dbui"
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_show_database_icon = 1

			-- Layout da UI
			vim.g.db_ui_win_position = "left"
			vim.g.db_ui_winwidth = 40
		end,
	},
	{
		"kristijanhusak/vim-dadbod-completion",
		dependencies = { "tpope/vim-dadbod" },
		ft = { "sql", "mysql", "plsql" },
	},
}
