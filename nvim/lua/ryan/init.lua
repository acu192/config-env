-- "Leader" key: Many people use <Space>. I use <Comma>.
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Disable netrw:
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- The <Colon> is too hard to type. I'll remap <Space> for this.
-- Also remap the <Colon> to <Nop> to try to train myself to stop using it!
vim.keymap.set({ 'n', 'v' }, '<Space>', ':', {desc = 'Mapped to <Colon>'})
vim.keymap.set({ 'n', 'v' }, ':', '<Nop>', {desc = 'Stop using this! Use <Space> instead!'})

-- <ESC> is too far away. I'll use 'jj'.
vim.keymap.set('i', 'jj', '<ESC>', {desc = 'Mapped to <ESC>'})

-- Other ways to save the buffer:
local write_buffer = function()
  vim.cmd('w')
end
vim.keymap.set({'n', 'i'}, '<C-s>', write_buffer, {silent = true, desc = 'Save Buffer'})
vim.keymap.set({'n', 'i'}, '<leader>s', write_buffer, {silent = true, desc = 'Save Buffer (also Ctrl+s)'})

-- Other ways to quit vim:
local quit_twice = function()
  -- We do it twice to avoid the annoying 'E173 (n more file(s) to edit)' error message.
  vim.cmd('silent! q')
  vim.cmd('silent! q')
end
vim.keymap.set({'n', 'i'}, '<C-q>', quit_twice, {silent = true, desc = 'Quit Neovim'})
vim.keymap.set({'n', 'i'}, '<leader>q', quit_twice, {silent = true, desc = 'Quit Neovim (also Ctrl+q)'})

-- Clear searches when you don't want to see them anymore:
vim.keymap.set('n', '<leader>/', ':nohlsearch<CR>', {desc = 'Clear Active Search'})

-- Tell nvim our terminal supports 24bit RGB colors.
-- See: https://github.com/termstandard/colors
vim.o.termguicolors = true

-- Make `gg` (and other commands) go to the first non-blank character!
-- This is the old vim behavior and I'm just used to it that way.
vim.o.startofline = true

-- Use `Q` to run the macro stored in `q`.
-- I.e. Record the macro with `qq`, the replay it with `Q`.
vim.keymap.set('n', 'Q', '@q', {desc = 'Run the macro stored in `q`. Hint: Use `qq` to first record the macro.'})

-- Quick way to turn on/off spelling.
-- Also turn it on by default.
vim.keymap.set('n', '<F5>', ':set spell!<CR>', {silent = true, desc = 'Toggle Spell Checker'})
vim.keymap.set('n', '<leader>5', ':set spell!<CR>', {silent = true, desc = 'Toggle Spell Checker (also <F5>)'})
vim.o.spell = true

-- Quick way to turn on/off wordwrap.
-- Also configure how we want the defaults.
vim.keymap.set('n', '<F6>', ':set wrap!<CR>', {silent = true, desc = 'Toggle Word Wrap'})
vim.keymap.set('n', '<leader>6', ':set wrap!<CR>', {silent = true, desc = 'Toggle Word Wrap (also <F6>)'})
vim.o.wrap = false
vim.o.breakindent = true
vim.o.linebreak = true

-- Make the cursor move to the next visual line instead of the next actual line.
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('i', '<Up>', "v:count == 0 ? '<C-o>gk' : '<C-o>k'", { expr = true, silent = true })
vim.keymap.set('i', '<Down>', "v:count == 0 ? '<C-o>gj' : '<C-o>j'", { expr = true, silent = true })

-- Keep the cursor away from the bottom and top of the window.
vim.o.scrolloff = 7

-- Line numbers!
vim.o.number = true

-- Search case rules:
--  (1) case is ignored when the search string is all lowercase,
--  (2) case is respected when the search string contains at least one uppercase character.
-- Those rules apply for manual search. The `*` and `#` command always ignore case.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep the sign column visible at all times.
-- This is so that plugins like `gitsigns.nvim` don't
-- cause the buffer view to jitter left/right as
-- the first/last signs comes in/out.
vim.o.signcolumn = 'yes'

-- Show a visual gutter at 80 characters.
vim.o.colorcolumn = "80"

-- Wait only 300ms until a partial command times out (default is 1000ms).
vim.o.timeoutlen = 300

-- In visual mode, have J and K move the selected lines up and down.
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Keep cursor in the middle of the viewport as you to to next ('n') and
-- previous ('N') search term.
--vim.keymap.set('n', 'n', 'nzzzv')
--vim.keymap.set('n', 'N', 'Nzzzv')

-- Quick way to visually select the entire file:
vim.keymap.set('n', '<leader>G', 'GVgg', { silent = true, desc = 'Select Entire Buffer'})

-- Override the diagnostic icons:
vim.fn.sign_define("DiagnosticSignError",
  {texthl = "DiagnosticSignError", text = "󰅚", numhl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
  {texthl = "DiagnosticSignWarn", text = "󰀪", numhl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",
  {texthl = "DiagnosticSignInfo", text = "󰋽", numhl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",
  {texthl = "DiagnosticSignHint", text = "󰌶", numhl = "DiagnosticSignHint"})

-- Set up diagnostics the way I like:
vim.diagnostic.config({
  virtual_text = {
    source = 'if_many',
    prefix = '▋', -- https://en.wikipedia.org/wiki/Block_Elements
  },
  severity_sort = true,
  float = {  -- <-- floating window settings for when you do `vim.diagnostic.open_float()`
    source = 'if_many',
    severity_sort = true,
  },
})

-- Close floating windows with <ESC>:
vim.keymap.set("n", "<ESC>", function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative == "win" then
      vim.api.nvim_win_close(win, false)
    end
  end
end)

-- TODO: Easy quickfix navigation:
-- ???

-- Highlight trailing whitespace:
require('ryan/whitespace')

-- Return to previous position in buffer:
require('ryan/returntopos')
