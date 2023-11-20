--
-- See: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
--

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
      auto_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",    -- ctrl+space
          node_incremental = "<C-space>",  -- ctrl+space
          scope_incremental = false,       -- disabled
          node_decremental = "<C-a>",      -- ctrl+a
        },
      },
    })
  end
}
