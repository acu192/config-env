return {
  'lewis6991/gitsigns.nvim', opts = {
    current_line_blame_opts = {
      delay = 0,
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      map('n', '<F1>',      gs.next_hunk, {desc = 'Go To Next Git Hunk'})
      map('n', '<leader>1', gs.next_hunk, {desc = 'Go To Next Git Hunk (also <F1>)'})

      map('n', '<F2>',      gs.prev_hunk, {desc = 'Go To Previous Git Hunk'})
      map('n', '<leader>2', gs.prev_hunk, {desc = 'Go To Previous Git Hunk (also <F2>)'})

      map('n', '<F3>',      gs.preview_hunk_inline, {desc = 'Preview Git Diff'})
      map('n', '<leader>3', gs.preview_hunk_inline, {desc = 'Preview Git Diff (also <F3>)'})

      map('n', '<F4>',      gs.stage_hunk, {desc = 'Stage Current Git Hunk'})
      map('n', '<leader>4', gs.stage_hunk, {desc = 'Stage Current Git Hunk (also <F4>)'})

      map('v', '<F4>',      function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = 'Stage Selected Git Hunk'})
      map('v', '<leader>4', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = 'Stage Selected Git Hunk (also <F4>)'})

      map('n', '<leader>B', gs.toggle_current_line_blame, {desc = 'Toggle Current Line Git Blame'})
    end
  },
}
