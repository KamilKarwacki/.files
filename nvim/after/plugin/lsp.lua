require("mason").setup()

vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'popup' }

vim.lsp.config('lua_ls', {
  settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
})
vim.lsp.enable({ 'lua-language-server', 'lua_ls'})

-- lsp based auto complete
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

    -- tab + enter type of choosing 
    vim.keymap.set('i', '<Tab>', function()
      if vim.fn.pumvisible() == 1 then
        return '<C-n>'
      end
      return '<Tab>'
    end, { expr = true })

    vim.keymap.set('i', '<S-Tab>', function()
      if vim.fn.pumvisible() == 1 then
        return '<C-p>'
      end
      return '<S-Tab>'
    end, { expr = true })

    vim.keymap.set('i', '<CR>', function()
      if vim.fn.pumvisible() == 1 then
        return '<C-y>'
      end
      return '<CR>'
    end, { expr = true })
  end,
})

-- buffer based auto complete
vim.o.autocomplete = true


vim.lsp.enable('pyright')
vim.lsp.enable('clangd')


vim.diagnostic.config({
  virtual_lines = {
    current_line = true,
  },
})
