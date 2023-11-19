-- Ryan's basic setup:
require('ryan')

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

  -- Navagate windows with ctrl+hjkl:
  { 'christoomey/vim-tmux-navigator', lazy = false },

  -- Show pending keybinds:
  --   Bonus: It also shows spelling suggestions
  --          with `z=` when over a misspelled word!
  { 'folke/which-key.nvim', opts = {} },

  -- Theme & statusline:
  require('package/catppuccin-config'),
  require('package/lualine-config'),

  -- Comment/uncomment lines with:
  --   gcc: toggle current line
  --   gc<motion>: toggle over the motion
  --   gcA: add comment to end of current line
  { 'numToStr/Comment.nvim', opts = {} },

  -- Git status in the gutter:
  require('package/gitsigns-config'),

  -- Treesitter for parsing and correct highlighting of various languages:
  require('package/treesitter-config'),

  -- Show open buffers as (what most people call) "tabs" at the top of nvim:
  require('package/bufferline-config'),

  -- A built-in file tree:
  require('package/nvim-tree-config'),

  -- LSP Configuration & Plugins:
  require('package/lspconfig-config'),

  -- LSP-powered autocompletion:
  require('package/cmp-config'),
}, {})

-- Enable certain language-specific LSPs:
require('lsp-langs')
