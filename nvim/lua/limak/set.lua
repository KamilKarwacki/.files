-- the cursor is always big and never shrinks 
-- to the thin line because of that 
vim.opt.guicursor = ""

-- line numbers appear on the left
vim.opt.nu = true
-- and the line numbers are relative 
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
-- when searching or replacing, you can see the effect of the operation in 
-- real time
vim.opt.incsearch = true

vim.opt.smartindent = true

vim.opt.scrolloff = 8

-- lines extend to infinity when they are very long
vim.opt.wrap = false

-- leader key is usually defined to 
-- avoid collisions with vim buint in keybindings
-- I set it to space
vim.g.mapleader = " "

-- apparently this makes some coloring better 
vim.opt.termguicolors = true

-- faster update time  
vim.opt.updatetime = 50

-- the sign column shows warnings of lsp 
-- if not always on, the column jumps back and forth
vim.opt.signcolumn = "yes"
