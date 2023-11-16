local hl = 'RedrawDebugComposed'  -- see all options with `:highlight`

local re1 = [[/\s\+\%#\@<!$/]]
local re2 = [[/\s\+$/]]           

vim.cmd(string.format([[match %s %s]], hl, re1))

vim.cmd(string.format([[autocmd InsertEnter * match %s %s]], hl, re1))
vim.cmd(string.format([[autocmd InsertLeave * match %s %s]], hl, re2))

-- TODO autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

-- I'm worried about this whole feature given that neovim plugins use so many different buffers for different things.
-- We'll need to be super careful to only apply these things to the *code* buffers. We'll probably need to whitelist
-- a set of filetypes to be safe.

