local nnoremap = require("limak.keymap").nnoremap
-- opens netrw which is the buintin file explorer
nnoremap("<leader>pv", "<cmd>Ex<CR>")

-- go to root dir of config
vim.cmd([[command! Conf tabnew | Ex $HOME/.config/nvim/]])

-- Create an autocmd for setting Jenkinsfile syntax to Groovy
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*[jJ]enkinsfile",
  command = "set syntax=groovy"
})

nnoremap("<leader>te", ":tabedit <cr>")

-- no need to use shift ; to go into command mode 
vim.keymap.set("n", ";", ":")
vim.keymap.set("v", ";", ":")
