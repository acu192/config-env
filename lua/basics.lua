-- "Leader" key: Many people use <Space>. I use <Comma>.
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- The <Colon> is too hard to type. I'll remap <Space> for this.
-- Also remap the <Colon> to <Nop> to try to train myself to stop using it!
vim.keymap.set({ 'n', 'v' }, '<Space>', ':', {desc = 'Mapped to <Colon>'})
vim.keymap.set({ 'n', 'v' }, ':', '<Nop>', {desc = 'Stop using this! Use <Space> instead!'})

-- <ESC> is too far away. I'll use 'jj'.
vim.keymap.set('i', 'jj', '<ESC>', {desc = 'Mapped to <ESC>'})

-- Other ways to save the buffer:
vim.keymap.set('n', '<C-s>', ':w<CR>', {silent = true, desc = 'Save Buffer'})
vim.keymap.set('i', '<C-s>', '<ESC>:w<CR>a', {silent = true, desc = 'Save Buffer'})
vim.keymap.set('n', '<leader>s', ':w<CR>', {silent = true, desc = 'Save Buffer'})
vim.keymap.set('i', '<leader>s', '<ESC>:w<CR>a', {silent = true, desc = 'Save Buffer'})

-- Other ways to quit vim:
vim.keymap.set('n', '<C-q>', ':q<CR>', {silent = true, desc = 'Quit Neovim'})
vim.keymap.set('i', '<C-q>', '<ESC>:q<CR>', {silent = true, desc = 'Quit Neovim'})
vim.keymap.set('n', '<leader>q', ':q<CR>', {silent = true, desc = 'Quit Neovim'})
vim.keymap.set('i', '<leader>q', '<ESC>:q<CR>', {silent = true, desc = 'Quit Neovim'})

-- Clear searches when you don't want to see them anymore:
vim.keymap.set('n', '<leader>/', ':nohlsearch<CR>', {desc = 'Clear Active Search'})

-- Tell nvim our terminal supports 24bit RGB colors.
-- See: https://github.com/termstandard/colors
vim.o.termguicolors = true

-- Make `gg` (and other commands) go to the first non-blank character!
-- This is the old vim behavior and I'm just used to it that way.
vim.o.startofline = true

-- Easy moving between windows:
vim.keymap.set('n', '<C-j>', '<C-w>j', {desc = 'Activate window DOWN'})
vim.keymap.set('n', '<C-k>', '<C-w>k', {desc = 'Activate window UP'})
vim.keymap.set('n', '<C-h>', '<C-w>h', {desc = 'Activate window LEFT'})
vim.keymap.set('n', '<C-l>', '<C-w>l', {desc = 'Activate window RIGHT'})

-- Use `Q` to run the macro stored in `q`.
-- I.e. Record the macro with `qq`, the replay it with `Q`.
vim.keymap.set('n', 'Q', '@q', {desc = 'Run the macro stored in `q`. Hint: Use `qq` to first record the macro.'})

-- Quick way to turn on/off spelling (also turn it on by default).
vim.keymap.set('n', '<F5>', ':set spell!<CR>', {silent = true, desc = 'Toggle Spell Checker'})
vim.keymap.set('n', '<leader>5', ':set spell!<CR>', {silent = true, desc = 'Toggle Spell Checker'})
vim.o.spell = true

-- Quick way to turn on/off wordwrap.
vim.keymap.set('n', '<F6>', ':set wrap!<CR>', {silent = true, desc = 'Toggle Word Wrap'})
vim.keymap.set('n', '<leader>6', ':set wrap!<CR>', {silent = true, desc = 'Toggle Word Wrap'})

-- Make the cursor move to the next visual line instead of the next actual line.
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('i', '<Up>', "v:count == 0 ? '<C-o>gk' : '<C-o>k'", { expr = true, silent = true })
vim.keymap.set('i', '<Down>', "v:count == 0 ? '<C-o>gj' : '<C-o>j'", { expr = true, silent = true })