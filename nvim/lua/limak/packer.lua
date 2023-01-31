-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

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

  -- fuzzy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- treesitter
  use('nvim-treesitter/nvim-treesitter',{run = ':TSUpdate'})
  use('theprimeagen/harpoon')
  use('mbbill/undotree')  
  use('tpope/vim-fugitive')
  -- rust 
  use 'simrat39/rust-tools.nvim'


  -- auto-completion c++
  -- use 'ranjithshegde/ccls.nvim'
 
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
