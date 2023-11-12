-- "Leader" key: Many people use <Space>. I use <Comma>.
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- The <Colon> is too hard to type. I'll remap <Space> for this.
vim.keymap.set({ 'n', 'v' }, '<Space>', ':', {desc = 'Mapped to <Colon>'})

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
