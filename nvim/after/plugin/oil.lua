require("oil").setup({
  -- I want to keep netrw
  default_file_explorer = false,
})
vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open parent directory" })
