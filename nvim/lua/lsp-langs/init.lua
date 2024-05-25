local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Python (npm install -g pyright)
require('lspconfig').pyright.setup({
  capabilities = capabilities,
})

-- Python (pip install python-lsp-server pylsp-mypy)
require('lspconfig').pylsp.setup({
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          enabled = false,
        },
        pyflakes = {
          enabled = false,
        },
        mypy = {
          enabled = true,
        },
      },
    },
  },
})

-- JavaScript, Typescript
require('lspconfig').tsserver.setup({
  capabilities = capabilities,
})

-- Rust
require('lspconfig').rust_analyzer.setup({
  capabilities = capabilities,
  cmd = { "rustup", "run", "stable", "rust-analyzer" },
})
