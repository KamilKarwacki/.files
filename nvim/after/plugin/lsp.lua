require("mason").setup()

vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'popup' }

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      vim.keymap.set('i', '<C-Space>', function()
        vim.lsp.completion.get()
      end, { buffer = ev.buf })
    end

    if vim.b[ev.buf].buffer_word_autocomplete then
      return
    end
    vim.b[ev.buf].buffer_word_autocomplete = true

    vim.api.nvim_create_autocmd('InsertCharPre', {
      buffer = ev.buf,
      callback = function()
        if vim.fn.pumvisible() == 1 or vim.fn.state('m') == 'm' then
          return
        end
        if not vim.v.char:match('[%w_]') then
          return
        end
        vim.api.nvim_feedkeys(vim.keycode('<C-x><C-n>'), 'm', false)
      end,
    })
  end,
})

vim.lsp.enable('pyright')
vim.lsp.enable('clangd')


vim.diagnostic.config({
  virtual_lines = {
    current_line = true,
  },
})
