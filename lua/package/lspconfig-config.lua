return {
  'neovim/nvim-lspconfig',
  dependencies = {
  },
  config = function()
    -- Python
    require('lspconfig').pyright.setup({})

    -- Rust
    require('lspconfig').rust_analyzer.setup({})
  end,
}
