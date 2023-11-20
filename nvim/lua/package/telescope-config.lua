return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')

    telescope.setup({})

    pcall(telescope.load_extension, 'fzf')

    vim.keymap.set('n', '<C-f>', builtin.find_files, {desc = 'Find Files'})
    vim.keymap.set('n', '<C-g>', builtin.git_files, {desc = 'Find Files (in Git)'})
    vim.keymap.set('n', '<leader>g', builtin.live_grep, {desc = 'Grep Files'})
  end,
}
