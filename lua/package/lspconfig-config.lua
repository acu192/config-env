return {
  'neovim/nvim-lspconfig',
  dependencies = {},
  config = function()
    require('lsp-langs')

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, {desc = '[DIAG] Open Floating Diagnostic Window'})
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {desc = '[DIAG] Goto Previous Diagnostic Issue'})
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {desc = '[DIAG] Goto Next Diagnostic Issue'})

    -- A hack to make the correct `desc` show in `which-key` for these keymaps.
    -- Without this, it shows the built-in `desc` of these keys, which I don't like!
    -- I feel like this is a bug in `which-key` so maybe that will be fixed at some point?
    vim.keymap.set('n', 'gt', '<Ignore>', {desc = '[LSP] Goto Type Definition'})
    vim.keymap.set('n', 'gi', '<Ignore>', {desc = '[LSP] Goto Implementation'})

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local function opts(desc)
          return {
            desc = desc,
            buffer = ev.buf,
          }
        end

        local function format()
          vim.lsp.buf.format({ async = true })
        end

        vim.keymap.set('n',          'gD',        vim.lsp.buf.declaration,     opts('[LSP] Goto Declaration'))
        vim.keymap.set('n',          'gd',        vim.lsp.buf.definition,      opts('[LSP] Goto Definition'))
        vim.keymap.set('n',          'gt',        vim.lsp.buf.type_definition, opts('[LSP] Goto Type Definition'))
        vim.keymap.set('n',          'gi',        vim.lsp.buf.implementation,  opts('[LSP] Goto Implementation'))
        vim.keymap.set('n',          'gr',        vim.lsp.buf.references,      opts('[LSP] Goto References'))
        vim.keymap.set('n',          'K',         vim.lsp.buf.hover,           opts('[LSP] Help: Hover'))
        vim.keymap.set('n',          'S',         vim.lsp.buf.signature_help,  opts('[LSP] Help: Signature'))
        vim.keymap.set('n',          '<leader>r', vim.lsp.buf.rename,          opts('[LSP] Rename Symbol'))
        vim.keymap.set({ 'n', 'v' }, '<leader>c', vim.lsp.buf.code_action,     opts('[LSP] Do Code Action'))
        vim.keymap.set('n',          '<leader>f', format,                      opts('[LSP] Format Code'))
      end,
    })
  end,
}
