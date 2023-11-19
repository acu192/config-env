return {
  'neovim/nvim-lspconfig',
  dependencies = {
  },
  config = function()
    require('lsp-langs')
  end,
}
