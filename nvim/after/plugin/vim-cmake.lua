vim.cmd([[let g:cmake_link_compile_commands = 1]])
vim.cmd([[let g:cmake_build_dir_location = './build']])


vim.keymap.set("n", "<leader>cmake", ":CMakeOpen<CR>")
vim.keymap.set("n", "<leader>ccmake", ":CMakeClose<CR>")
