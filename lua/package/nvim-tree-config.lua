return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local api = require('nvim-tree.api')

    local close = function()
      if vim.fn.mode() ~= 'n' then
        return '<Esc>'
      else
        vim.schedule(function()
          api.tree.close()
        end)
      end
    end

    local open = function()
      if vim.fn.mode() ~= 'n' then
        return '<Esc>'
      else
        vim.schedule(function()
          api.tree.open({find_file = true})
          api.tree.focus()
        end)
      end
    end

    local collapse = function()
      if vim.fn.mode() ~= 'n' then
        return '<Esc>'
      else
        vim.schedule(function()
          api.tree.collapse_all(false)
        end)
      end
    end

    vim.keymap.set({'n', 'i', 'v'}, '<F7>', close, {desc = 'Close File Tree', expr=true})
    vim.keymap.set({'n', 'i', 'v'}, '<F8>', open, {desc = 'Open File Tree', expr=true})
    vim.keymap.set({'n', 'i', 'v'}, '<F9>', collapse, {desc = 'Collapse File Tree', expr=true})

    vim.keymap.set('n', '<leader>7', close, {desc = 'Close File Tree (also <F7>)'})
    vim.keymap.set('n', '<leader>8', open, {desc = 'Open File Tree (also <F8>)'})
    vim.keymap.set('n', '<leader>9', collapse, {desc = 'Collapse File Tree (also <F9>)'})

    local function my_on_attach(bufnr)
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      local function go_window_right()
        vim.api.nvim_command('wincmd l')
      end

      vim.keymap.set('n', '<CR>',           api.node.open.edit,             opts('Open'))
      vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,             opts('Open'))
      vim.keymap.set('n', 'o',              api.node.open.edit,             opts('Open'))
      vim.keymap.set('n', 'O',              api.node.open.no_window_picker, opts('Open: No Window Picker'))
      vim.keymap.set('n', '\\',             api.node.open.vertical,         opts('Open: Vertical Split'))
      vim.keymap.set('n', '-',              api.node.open.horizontal,       opts('Open: Horizontal Split'))

      vim.keymap.set('n', '<Tab>',   go_window_right,                       opts('Move Focus to Buffers'))

      vim.keymap.set('n', '<BS>',    api.node.navigate.parent_close,        opts('Close Directory'))
      vim.keymap.set('n', '{',       api.node.navigate.parent,              opts('Parent Directory'))

      vim.keymap.set('n', 'i',       api.node.show_info_popup,              opts('Info'))
      vim.keymap.set('n', '.',       api.node.run.cmd,                      opts('Run Command'))

      vim.keymap.set('n', 'a',       api.fs.create,                         opts('Create'))
      vim.keymap.set('n', 'r',       api.fs.rename,                         opts('Rename'))
      vim.keymap.set('n', 'd',       api.fs.remove,                         opts('Delete'))
      vim.keymap.set('n', 'c',       api.fs.copy.node,                      opts('Copy'))
      vim.keymap.set('n', 'x',       api.fs.cut,                            opts('Cut'))
      vim.keymap.set('n', 'p',       api.fs.paste,                          opts('Paste'))

      vim.keymap.set('n', 'M',       api.tree.expand_all,                   opts('Expand All ([M]aximize)'))
      vim.keymap.set('n', 'm',       api.tree.collapse_all,                 opts('Collaps All ([m]inimize)'))
      vim.keymap.set('n', 'b',       api.tree.toggle_no_buffer_filter,      opts('Toggle Filter: No Buffer'))
      vim.keymap.set('n', 'h',       api.tree.toggle_hidden_filter,         opts('Toggle Filter: Dotfiles'))
      vim.keymap.set('n', 'g',       api.tree.toggle_gitignore_filter,      opts('Toggle Filter: Git Ignore'))
      vim.keymap.set('n', 'q',       api.tree.close,                        opts('Close'))
      vim.keymap.set('n', 'R',       api.tree.reload,                       opts('Refresh'))
      vim.keymap.set('n', '?',       api.tree.toggle_help,                  opts('Help'))
    end

    require("nvim-tree").setup({
      on_attach = my_on_attach,
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = true,
      view = {
        width = 40,
      },
      renderer = {
        add_trailing = false,
        highlight_opened_files = 'all',
        indent_markers = {
          enable = true,
        },
        icons = {
          git_placement = "after",  -- TODO: I'd like this to be "signcolumn", but it doesn't work when the file is both staged and unstaged (you only see the staged icon, which is misleading). It would be great if there was a special icon for staged and unstaged so that this worked well in the signcolumn! Currently nvim-tree doesn't support that.
          modified_placement = "after",
          diagnostics_placement = "signcolumn",
          bookmarks_placement = "signcolumn",
          show = {
            folder = false,
          },
        },
      },
      update_focused_file = {
        enable = true,
      },
      git = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
      },
      modified = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
        icons = {
          error = "󰅚",
          warning = "󰀪",
          info = "󰋽",
          hint = "󰌶",
        },
      },
    })

    -- Patch the diagnostic icon colors that are shown in the signcolumn:
    -- See:
    --  - https://github.com/nvim-tree/nvim-tree.lua/blob/80cfeadf179d5cba76f0f502c71dbcff1b515cd8/lua/nvim-tree/colors.lua#L92-L95
    --  - https://github.com/catppuccin/nvim/blob/a8dfb969e76d1a0752d98b5347be9ffb9bca9592/lua/catppuccin/groups/integrations/native_lsp.lua#L60-L63
    local new_links = {
      NvimTreeLspDiagnosticsError = "DiagnosticSignError",
      NvimTreeLspDiagnosticsWarning = "DiagnosticSignWarn",
      NvimTreeLspDiagnosticsInformation = "DiagnosticSignInfo",
      NvimTreeLspDiagnosticsHint = "DiagnosticSignHint",
    }
    for k, d in pairs(new_links) do
      vim.api.nvim_command("hi link " .. k .. " " .. d)
    end
  end,
}
