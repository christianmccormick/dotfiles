local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- appearance
  use 'EdenEast/nightfox.nvim'
  use 'lukas-reineke/indent-blankline.nvim'

  -- navigation
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'kevinhwang91/nvim-bqf'
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

  -- diagnostics
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- lsp
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'j-hui/fidget.nvim'

  -- ctags
  use 'ludovicchabant/vim-gutentags'

  -- formatting
  use 'gpanders/editorconfig.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'

  -- cmp
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-emoji'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'f3fora/cmp-spell'
  use 'dcampos/nvim-snippy'
  use 'dcampos/cmp-snippy'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'wassimk/cmp-rails-fixture-types'
  use 'wassimk/cmp-rails-fixture-names'

  -- editing
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'numToStr/Comment.nvim'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'RRethy/nvim-treesitter-endwise'
  use 'windwp/nvim-autopairs'

  -- ruby
  use {
    'nelstrom/vim-textobj-rubyblock',
    requires = { 'kana/vim-textobj-user' }
  }
  use 'tpope/vim-bundler'
  use 'tpope/vim-rails'

  -- go

  use 'fatih/vim-go'

  -- testing
  use 'vim-test/vim-test'

  -- git
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'

  -- terminal
  use 'akinsho/toggleterm.nvim'

  -- Automatically sets up this configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
