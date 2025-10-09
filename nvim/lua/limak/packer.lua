--t This file can be loaded by calling `lua require('plugins')` from your init.vim

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

  -- better than the regolith default, some nice color themes
  use 'folke/tokyonight.nvim'
  use 'Mofiqul/dracula.nvim'
  use 'dasupradyumna/midnight.nvim'
  use 'aktersnurra/no-clown-fiesta.nvim'
  use 'metalelf0/base16-black-metal-scheme'
  -- game from theprimeagen
  use 'ThePrimeagen/vim-be-good'

  -- tmux 
  use 'christoomey/vim-tmux-navigator'

  -- lsp stuff
  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional
    {'hrsh7th/cmp-nvim-lua'},     -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional
  }
  }

  -- fuzzy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- call tree
  use 'ldelossa/litee.nvim'
  use 'ldelossa/litee-calltree.nvim'

  -- needed for live grep 
  use 'BurntSushi/ripgrep'
  use 'sharkdp/fd'

  -- file explorer
  use 'stevearc/oil.nvim'

  -- treesitter
  use{'nvim-treesitter/nvim-treesitter',  tag = 'v0.10.0', run = ':TSUpdate'}
  --harpoon by primeagen
  use('theprimeagen/harpoon')
  --undo tree to go back and forth 
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  -- C++ stuff
  -- cmake integration
  use('cdelledonne/vim-cmake')

  -- C++ stuff end
  
  use 'voldikss/vim-floaterm'

  use 'vimwiki/vimwiki'

  -- fun stuff
  use 'ianding1/leetcode.vim'

  -- codeium  use 'Exafunction/codeium.vim'

  -- rust 
  use 'simrat39/rust-tools.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
