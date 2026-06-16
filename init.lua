-----------------------------------------------------------------------
------------------------- PLUGINS ------------------------------------
-----------------------------------------------------------------------

vim.pack.add({
	'https://github.com/nvim-treesitter/nvim-treesitter',
	'https://github.com/nvim-mini/mini.surround',
	'https://github.com/tpope/vim-fugitive',
	'https://github.com/stevearc/oil.nvim',
	'https://github.com/ibhagwan/fzf-lua',
	'https://github.com/L3MON4D3/LuaSnip',
	'https://github.com/widatama/vim-phoenix',
	{ src = 'https://github.com/saghen/blink.cmp', version = "v1" }
})
require('nvim-treesitter').setup({
	build = ':TSUpdate'
})
require('mini.surround').setup()
require('fzf-lua').setup()
require('oil').setup({
	use_default_keymaps = false,
	keymaps = {
		['<CR>'] 	= 'actions.select',
		['<C-c>'] 	= { 'actions.close', mode = 'n' },
		['-'] 		= { 'actions.parent', mode = 'n' },
		['_'] 		= { 'actions.open_cwd', mode = 'n' },
	},
	view_options = {
		show_hidden = true,
	},
})

require('blink.cmp').setup({
	keymap = {
		preset = 'default',
		['<Tab>'] = { 'accept', 'fallback' }
	},
	appearance = {
		nerd_font_variant = 'mono'
	},

	completion = {
		documentation = { auto_show = false }
	},

	sources = {
		default = { 'lsp', 'path', 'snippets' },
	},
})

require('opts');
require('keymaps');
require('commands');
require('lsp');

-- vim.cmd.colorscheme 'global'
vim.cmd.colorscheme 'phoenix'
vim.api.nvim_set_hl(0, 'MatchParen', { link = 'Cursor' })
vim.api.nvim_set_hl(0, 'StatusLine', { link = 'FloatShadow' })
