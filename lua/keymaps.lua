
-- Prevents losing selection after indenting
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- Navigating splits with C-[h/j/k/l]
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- KJ sequence as escape in insert mode
vim.keymap.set('i', 'kj', '<Esc>')

-- Remapping : with ; to have easier access to commands
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Plugin related keymaps

-- Open Oil explorer
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("i", "<Tab>", function()
	if vim.fn.pumvisible() == 1 then
		return "<C-y>"
	end
  	return "<Tab>"
end, { expr = true })

local fzf = require('fzf-lua')
vim.keymap.set("n", "<leader>sf", fzf.files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sn", function() fzf.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sn", function() fzf.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "[S]earch [N]eovim files" })
vim.keymap.set("n", "<leader>sb", function() fzf.buffers() end, { desc = "[S]earch [B]uffers" })
vim.keymap.set("n", "<leader>sg", function() fzf.live_grep() end, { desc = "[S]earch [G]rep" })

-- Prevent asterisk from jumping to the next occurence of the word
vim.keymap.set("n", "*", function() 
	vim.fn.setreg('/', vim.fn.expand('<cword>'))
	vim.opt.hls = true
end)

-----------------------------------------------------------------------
------------------------- LSP RELATED KEYMAPS -------------------------
-----------------------------------------------------------------------
---
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
	callback = function(event)
		-- Rename the variable under your cursor.
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })

		-- Execute a code action
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })

		-- Display hint about the token under cursor
		vim.keymap.set('n', '<leader>ch', function()
			vim.lsp.buf.hover { border = 'single' }
		end, { desc = '[C]ode [H]int' })

		-- Diagnostic keymaps
		vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
	end
})
