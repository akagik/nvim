require'plugins'

vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]

vim.api.nvim_command('set number')

-- クリップボードを有効にする
vim.api.nvim_command('set clipboard+=unnamedplus')
vim.api.nvim_command('set expandtab')
