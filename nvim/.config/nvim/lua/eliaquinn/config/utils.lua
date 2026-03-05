local M = {}

function M.show_last_commit_diff()
	local filepath = vim.fn.expand("%:p")

	-- Usa git rev-parse para achar o root (funciona com worktrees também)
	local git_root = vim.fn
		.system("git -C " .. vim.fn.shellescape(vim.fn.expand("%:p:h")) .. " rev-parse --show-toplevel 2>/dev/null")
		:gsub("\n", "")

	if git_root == "" or vim.v.shell_error ~= 0 then
		vim.notify("Not in a git repository", vim.log.levels.ERROR)
		return
	end

	-- Caminho RELATIVO ao git root (necessário para git show)
	local rel_path = filepath:sub(#git_root + 2)

	-- Acha o hash do último commit que tocou esse arquivo
	local hash = vim.fn
		.system(
			string.format(
				"git -C %s log -1 --pretty=format:%%H -- %s 2>/dev/null",
				vim.fn.shellescape(git_root),
				vim.fn.shellescape(rel_path)
			)
		)
		:gsub("\n", "")

	if hash == "" then
		vim.notify("No commits found for this file", vim.log.levels.WARN)
		return
	end

	-- Pega o diff desse commit específico para esse arquivo
	local output = vim.fn.system(
		string.format(
			"git -C %s show %s -- %s 2>/dev/null",
			vim.fn.shellescape(git_root),
			hash,
			vim.fn.shellescape(rel_path)
		)
	)

	if output == "" then
		vim.notify("No diff found", vim.log.levels.WARN)
		return
	end

	-- Cria popup flutuante
	local lines = vim.split(output, "\n")
	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	vim.bo[buf].filetype = "diff"

	local width = math.min(math.floor(vim.o.columns * 0.85), 120)
	local height = math.min(#lines, math.floor(vim.o.lines * 0.75))

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = math.floor((vim.o.lines - height) / 2),
		col = math.floor((vim.o.columns - width) / 2),
		style = "minimal",
		border = "rounded",
		title = string.format(" Last commit: %.8s ", hash),
		title_pos = "center",
	})

	-- Fecha com q ou Esc
	vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = buf, silent = true })
	vim.keymap.set("n", "<Esc>", "<cmd>close<CR>", { buffer = buf, silent = true })
end

return M
