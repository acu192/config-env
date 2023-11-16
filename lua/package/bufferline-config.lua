return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'catppuccin',
  },
  opts = function()
    vim.keymap.set({'n', 'i', 'v'}, '<C-w>', function()
      if vim.fn.mode() ~= 'n' then
        return '<Esc>'
      else
        vim.schedule(function() vim.cmd("silent! bdelete") end)
      end
    end, {desc = 'Close *Current* Buffer (IF SAVED)', expr=true})

    vim.keymap.set({'n', 'i', 'v'}, '<C-b>', function()
      if vim.fn.mode() ~= 'n' then
        return '<Esc>'
      else
        vim.schedule(function() vim.cmd("BufferLineCloseOthers") end)
      end
    end, {desc = 'Close All *Other* Buffers (IF SAVED)', expr=true})

    vim.keymap.set('n', '<S-Tab>', function()
      vim.cmd("BufferLineCyclePrev")
    end, {desc = 'Cycle to Previous Buffer'})

    vim.keymap.set('n', '<Tab>', function()
      vim.cmd("BufferLineCycleNext")
    end, {desc = 'Cycle to Next Buffer'})

    vim.keymap.set('n', '<leader>w', function() vim.cmd("silent! bdelete") end, {desc = 'Close *Current* Buffer (IF SAVED)'})
    vim.keymap.set('n', '<leader>b', function() vim.cmd("BufferLineCloseOthers") end, {desc = 'Close All *Other* Buffers (IF SAVED)'})
    vim.keymap.set('n', '<leader>n', function() vim.cmd("BufferLineCycleNext") end, {desc = 'Cycle to Next Buffer'})

    --local mocha = require("catppuccin.palettes").get_palette("mocha")
    --print(vim.inspect(mocha))
    return {
      options = {
        separator_style = 'slant',
        color_icons = false,
        always_show_bufferline = false,              -- if false, the line hides when only one buffer is open
        show_buffer_close_icons = false,
        close_command = "silent! bdelete %d",        -- can be a string | function | false
        left_mouse_command = "buffer %d",            -- can be a string | function | false
        middle_mouse_command = "silent! bdelete %d", -- can be a string | function | false
        right_mouse_command = "vertical sbuffer %d", -- can be a string | function | false
        diagnostics = false,  -- TODO: "nvim_lsp" ?
        offsets = {
          {
            filetype = "NvimTree",  -- TODO: does this work?
            text = function()
              return vim.fn.getcwd()
            end,
            highlight = "Directory",
            text_align = "left"
          },
        },
      },
      highlights = require("catppuccin.groups.integrations.bufferline").get({
        styles = { "bold" },  -- none, any, or both of: "italic", "bold"
        custom = {
          all = {
          },
          mocha = {
            --background = { fg = mocha.text },
            fill = { bg = "#000000" },
            separator = { fg = "#000000" },
            separator_selected = { fg = '#000000' },
          },
        },
      }),
    }
  end,
}
