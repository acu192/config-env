-- "Leader" key: Many people use <Space>. I use <Comma>.
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- The <Colon> is too hard to type. I'll remap <Space> for this.
vim.keymap.set({ 'n', 'v' }, '<Space>', ':')

-- <Esc> is too far away. I'll use 'jj'.
vim.keymap.set('i', 'jj', '<Esc>')

-- Tell nvim our terminal supports 24bit RGB colors.
-- See: https://github.com/termstandard/colors
vim.o.termguicolors = true

-- Make `gg` (and other commands) go to the first non-blank character!
-- This is the old vim behavior and I'm just used to it that way.
vim.o.startofline = true
