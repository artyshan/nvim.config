vim.lsp.config['jdtls'] = {
	cmd = { '/home/artyshan/Downloads/jdt/bin/jdtls' },
	filetypes = { 'java' },
	root_markers = { '.mvn', 'pom.xml' },
}
vim.lsp.config['lua'] = {
	cmd = { 'lua-language-server' },
	root_markers = { '.luarc.json' },
	filetypes = { 'lua' },
}
vim.lsp.config['ts'] = {
	cmd = { 'typescript-language-server', '--stdio' },
	root_markers = { 'tsconfig.json' },
	filetypes = { 'typescript' },
}
vim.lsp.config['somesass-ls'] = {
	cmd = { 'some-sass-language-server', '--stdio' },
	root_markers = { 'package.json' },
	filetypes = { 'scss', 'sass' },
}
vim.lsp.config['c'] = {
	cmd = { 'clangd' },
	filetypes = { 'c' },
}
vim.lsp.config['xml'] = {
	cmd = { 'java', '-jar', '/home/artyshan/Downloads/lemminx.jar' },
	filetypes = { 'xml' },
}

vim.lsp.enable { 'jdtls' }
vim.lsp.enable { 'lua' }
vim.lsp.enable { 'ts' }
vim.lsp.enable { 'somesass-ls' }
vim.lsp.enable { 'c' }
vim.lsp.enable { 'xml' }
