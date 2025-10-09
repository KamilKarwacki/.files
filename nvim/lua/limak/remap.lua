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

vim.keymap.set("v", "<leader>y", '"+y', {desc = "Copy to system clip board"})

-- no need to use shift ; to go into command mode 
vim.keymap.set("n", ";", ":")
vim.keymap.set("v", ";", ":")

-- auto save when going into normal mode
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    if vim.bo.modified and vim.bo.modifiable then
      vim.cmd("silent write")
    end
  end,
})


-- deletes all swap files
vim.api.nvim_create_user_command("RemoveSwapFiles", function()
  vim.fn.system({
    "find", vim.fn.stdpath("state") .. "/swap",
    "-type", "f", "-name", "*.swp", "-delete"
  })
end, {})

-- copies current full file path to clipboard
vim.api.nvim_create_user_command(
  "CopyFileName",
  function()
    vim.cmd('let @+ = expand("%:p")')
  end,
  {}
)


