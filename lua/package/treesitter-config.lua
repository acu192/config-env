# See: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
local parsers_to_install = {
  'bash',
  'c',
  'cmake',
  'cpp',
  'css',
  'csv',
  'cuda',
  'diff',
  'dockerfile',
  'dot',
  'gitcommit',
  'gitignore',
  'html',
  'javascript',
  'json',
  'lua',
  'make',
  'proto',
  'python',
  'rust',
  'scss',
  'sql',
  'terraform',
  'typescript',
  'vue',
}

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
        ensure_installed = parsers_to_install,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
  end
}
