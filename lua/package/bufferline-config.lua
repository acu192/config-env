return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'catppuccin',
    'famiu/bufdelete.nvim',
  },
  opts = function()
    vim.keymap.set({'n', 'i', 'v'}, '<C-w>', function()
      if vim.fn.mode() ~= 'n' then
        return '<Esc>'
      else
        vim.schedule(function() vim.cmd("silent! Bdelete") end)
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

    vim.keymap.set('n', '<leader>w', function() vim.cmd("silent! Bdelete") end, {desc = 'Close *Current* Buffer (IF SAVED)'})
    vim.keymap.set('n', '<leader>b', function() vim.cmd("BufferLineCloseOthers") end, {desc = 'Close All *Other* Buffers (IF SAVED)'})

    --local mocha = require("catppuccin.palettes").get_palette("mocha")
    --print(vim.inspect(mocha))
    return {
      options = {
        separator_style = 'slant',
        color_icons = false,
        always_show_bufferline = true,               -- if false, the line hides when only one buffer is open
        show_buffer_close_icons = false,
        close_command = "silent! Bdelete %d",        -- can be a string | function | false
        left_mouse_command = "buffer %d",            -- can be a string | function | false
        middle_mouse_command = "silent! Bdelete %d", -- can be a string | function | false
        right_mouse_command = "vertical sbuffer %d", -- can be a string | function | false
        diagnostics = false,  -- TODO: "nvim_lsp" ?
        offsets = {
          {
            filetype = "NvimTree",
            --text = function()
            --  return vim.fn.getcwd()
            --end,
            --highlight = "BufferLineOffsetSeparator",
            --text_align = "left",
          },
        },
        custom_filter = function(buf_number, buf_numbers)
          if vim.bo[buf_number].filetype ~= "NvimTree" then
            return true
          end
        end
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
