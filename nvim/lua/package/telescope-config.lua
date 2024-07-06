local select_one_or_multi = function(prompt_bufnr)
  local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()

  if vim.tbl_isempty(multi) then
    require('telescope.actions').select_default(prompt_bufnr)
    return
  end

  require('telescope.actions').close(prompt_bufnr)
  for _, entry in pairs(multi) do
    local filename = entry.filename or entry.value
    local lnum = entry.lnum or 1
    local lcol = entry.col or 1
    if filename then
      vim.cmd(string.format("edit +%d %s", lnum, filename))
      vim.cmd(string.format("normal! %dG%d|", lnum, lcol))
    end
  end
end

local open_all = function(prompt_bufnr)
  local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
  local manager = picker.manager

  require('telescope.actions').close(prompt_bufnr)
  for entry in manager:iter() do
    local filename = entry.filename or entry.value
    local lnum = entry.lnum or 1
    local lcol = entry.col or 1
    if filename then
      vim.cmd(string.format("edit +%d %s", lnum, filename))
      vim.cmd(string.format("normal! %dG%d|", lnum, lcol))
    end
  end
end

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

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ['<CR>'] = select_one_or_multi,
            ['<M-CR>'] = open_all,
          }
        }
      }
    })

    pcall(telescope.load_extension, 'fzf')

    vim.keymap.set('n', '<C-f>', builtin.find_files, {desc = 'Find Files (in CWD)'})
    vim.keymap.set('n', '<C-g>', builtin.git_files, {desc = 'Find Files (in Git root)'})
    vim.keymap.set('n', '<leader>g', builtin.live_grep, {desc = 'Live Grep Files (in CWD)'})
    vim.keymap.set('n', '<leader>*', builtin.grep_string, {desc = 'Search Selection'})
    vim.keymap.set('n', '<leader>D', builtin.diagnostics, {desc = 'List Diagnostics'})
  end,
}
