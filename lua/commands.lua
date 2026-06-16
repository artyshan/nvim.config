-----------------------------------------------------------------------
------------------------- COMMANDS ------------------------------------
-----------------------------------------------------------------------

vim.api.nvim_create_user_command('InspectRtp', function()
	vim.cmd "new | put =split(&runtimepath, ',')"
end, {})

vim.api.nvim_create_user_command('ShowWhitespace', function()
	vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
end, {})

vim.api.nvim_create_user_command('HideWhitespace', function()
	vim.opt.listchars = { tab = '  ', trail = ' ', nbsp = ' ' }
end, {})

-----------------------------------------------------------------------
------------------------- AUTOCOMMANDS --------------------------------
-----------------------------------------------------------------------

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking text',
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
