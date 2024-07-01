local hl = 'RedrawDebugComposed'  -- see all options with `:highlight`

local re1 = [[/\s\+\%#\@<!$/]]
local re2 = [[/\s\+$/]]

vim.cmd(string.format([[match %s %s]], hl, re1))

vim.cmd(string.format([[autocmd InsertEnter * match %s %s]], hl, re1))
vim.cmd(string.format([[autocmd InsertLeave * match %s %s]], hl, re2))
