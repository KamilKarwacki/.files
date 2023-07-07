vim.cmd [[
  let g:leetcode_browser = 'firefox'
]]

vim.keymap.set("n", "<leader>ll", ":LeetCodeList<CR>")
vim.keymap.set("n", "<leader>lt", ":LeetCodeTest<CR>")
vim.keymap.set("n", "<leader>ls", ":LeetCodeSubmit<CR>")
vim.keymap.set("n", "<leader>li", ":LeetCodeSignIn<CR>")
