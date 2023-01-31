local nnoremap = require("limak.keymap").nnoremap
nnoremap("<leader>pv", "<cmd>Ex<CR>")

-- supposed to be used with moonlander setup 
-- actually shift plus F1 but 
vim.keymap.set("i", "<F13>", "<ESC>")
vim.keymap.set("n", "<F13>", "<ESC>")
vim.keymap.set("v", "<F13>", "<ESC>")
-- to forget about the old escapa position
vim.keymap.set("i", "<ESC>", "")


vim.keymap.set("n", ";", ":")
vim.keymap.set("v", ";", ":")
