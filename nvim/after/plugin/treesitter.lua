-- nvim-treesitter `main` branch: no configs.setup(); parsers via :TSInstall,
-- highlighting via vim.treesitter.start() per buffer.
local langs = { "cpp", "python", "rust", "lua", "vim", "llvm", "odin" }
require("nvim-treesitter").install(langs)

vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    if not lang or not vim.tbl_contains(langs, lang) then return end
    if lang == "cpp" and vim.api.nvim_buf_line_count(ev.buf) > 10000 then return end
    pcall(vim.treesitter.start, ev.buf, lang)
  end,
})

vim.filetype.add({ extension = { icc = "cpp" } })
