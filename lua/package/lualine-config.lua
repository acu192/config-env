--
-- See: https://github.com/nvim-lualine/lualine.nvim
--

local filename = {
  'filename',
  path = 1,                -- 0: filename; 1: relative path; 2: abs path; 3: abs path with tilde
  shorting_target = 40,    -- truncate long paths
  symbols = {
    modified = '●',        -- text to show when the file is modified
    readonly = '󰂭',        -- text to show when the file is non-modifiable or readonly
    unnamed = '[No Name]', -- text to show for unnamed buffers
    newfile = '[New]',     -- text to show for newly created file before first write
  },
}

local diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic', 'coc' },  -- TODO: add `nvim_lsp`
}

return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = true,
      theme = 'catppuccin',
      component_separators = '|',
      section_separators = '',
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', diagnostics},
      lualine_c = {filename},
      lualine_x = {'searchcount', 'filetype', 'encoding', 'fileformat'},
      lualine_y = {'progress'},
      lualine_z = {'location'},
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {filename},
      lualine_x = {'filetype', 'encoding', 'fileformat', 'progress'},
      lualine_y = {},
      lualine_z = {},
    },
    extensions = {
      'nvim-tree',
      'lazy',
      -- TODO: fugitive?, mason?, quickfix?
    },
  },
}
