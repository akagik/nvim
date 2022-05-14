vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- 起動時に読み込むプラグインは名前を書くだけです
  use'tpope/vim-surround'
  use'tpope/vim-fugitive'
  use'tpope/vim-repeat'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
end)

