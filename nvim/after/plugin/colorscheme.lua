--tokyonight not usefull with gruvbox regolith
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true

vim.opt.background = "dark"

-- setup must be called before loading the colorscheme
-- Default options:
--require("gruvbox").setup({
--  undercurl = true,
--  underline = true,
--  bold = true,
--  italic = true,
--  strikethrough = true,
--  invert_selection = false,
--  invert_signs = false,
--  invert_tabline = false,
--  invert_intend_guides = false,
--  inverse = true, -- invert background for search, diffs, statuslines and errors
--  contrast = "", -- can be "hard", "soft" or empty string
--  palette_overrides = {},
--  overrides = {},
--  dim_inactive = true,
--  transparent_mode = true,
--})
-- vim.cmd([[colorscheme tokyonight-night]])
vim.cmd([[no-clown-fiesta]])
