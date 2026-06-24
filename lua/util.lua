local M = {}

M.format_current_buffer = function()
	local buf = vim.api.nvim_get_current_buf()
	local filename = vim.api.nvim_buf_get_name(buf)
	local file_content = table.concat(
		vim.api.nvim_buf_get_lines(buf, 0, -1, false),
		"\n"
	)

	local result = vim.system(
		{ "prettier", "--stdin-filepath", filename },
		{ stdin = file_content, text = true }
	):wait(1000)

	if result.code == 0 then
		vim.api.nvim_buf_set_lines(
			buf,
			0,
			-1,
			false,
			vim.split(result.stdout, "\n", { plain = true })
		)
	elseif result.code == 124 then
		vim.notify("Formatter timed out", vim.log.levels.ERROR)
	else
		vim.notify(result.stderr, vim.log.levels.ERROR)
	end
end

return M
