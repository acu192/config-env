local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Python
require('lspconfig').pyright.setup({
  capabilities = capabilities,
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
