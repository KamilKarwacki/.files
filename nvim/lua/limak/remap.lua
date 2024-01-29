local nnoremap = require("limak.keymap").nnoremap
-- opens netrw which is the buintin file explorer
nnoremap("<leader>pv", "<cmd>Ex<CR>")

nnoremap("<leader>te", ":tabedit <cr>")

-- no need to use shift ; to go into command mode 
vim.keymap.set("n", ";", ":")
vim.keymap.set("v", ";", ":")
