-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
-- Taken from https://github.com/nvim-lua/kickstart.nvim/blob/a005f15cec8072c97201f86e15df62c7e4a4490e/init.lua#L292-L301
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
