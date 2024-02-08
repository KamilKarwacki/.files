local nnoremap = require("limak.keymap").nnoremap
-- opens netrw which is the buintin file explorer
nnoremap("<leader>pv", "<cmd>Ex<CR>")

-- go to root dir of config
vim.cmd([[command! Conf tabnew ~/.config/nvim/ | Ex]])



nnoremap("<leader>te", ":tabedit <cr>")

-- no need to use shift ; to go into command mode 
vim.keymap.set("n", ";", ":")
vim.keymap.set("v", ";", ":")
