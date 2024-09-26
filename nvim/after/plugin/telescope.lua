local builtin = require('telescope.builtin')

-- runs normal file search from the directory we are currently in (:pwd)
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- search only for files that are tracked by git
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- search using grep, will only show files where grep was matching something
vim.keymap.set('n', '<leader>pl', builtin.live_grep, {})

-- not really used I like live_grep more
--vim.keymap.set('n', '<leader>ps', function()
--              builtin.grep_string({ search = vim.fn.input("Grep > ") });
--            end)

require('telescope').setup{
  defaults = {
		file_ignore_patterns = {
			"build",
			"third_party"
		}
	}
}
