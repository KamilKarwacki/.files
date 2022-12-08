-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  -- better than the regolith default
  use 'ellisonleao/gruvbox.nvim'
  -- use 'folke/tokyonight.nvim'

  -- game from theprimeagen
  use 'ThePrimeagen/vim-be-good'

  -- lsp stuff
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-nvim-lua'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lsp-signature-help'
	use 'hrsh7th/cmp-path'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
  
  -- rust 
  use 'simrat39/rust-tools.nvim'


  -- auto-completion c++
  -- use 'ranjithshegde/ccls.nvim'
end)
