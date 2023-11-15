-- Ryan's basic setup:
require('basics')

-- Highlight trailing whitespace:
--require('whitespace')

-- Return to previous position in buffer:
require('returntopos')

-- Bootstrap lazy.nvim as our package manager:
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Tell lazy.nvim which packages we want it to install for us:
require('lazy').setup({
  -- Detect tabstop and shiftwidth automatically:
  'tpope/vim-sleuth',

  -- Show pending keybinds:
  -- Bonus: it also shows spelling suggestions with `z=` when over a misspelled word!
  { 'folke/which-key.nvim', opts = {} },

  -- Theme & statusline:
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  require('lualine-config'),

  -- Comment/uncomment lines with:
  --   gcc: toggle current line
  --   gc<motion>: toggle over the motion
  --   gcA: add comment to end of current line
  { 'numToStr/Comment.nvim', opts = {} },

  -- Git status in the gutter:
  require('gitsigns-config'),

  require('treesitter-config'),
}, {})

-- Now that catppuccin is install (above), we can set the color scheme to use it.
-- Catppuccin has four themes:
--   light: catppuccin-latte
--   dark:  catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
-- See: https://github.com/catppuccin/nvim
vim.cmd.colorscheme "catppuccin-mocha"

-- Highlight on yank:
require('hlonyank')
