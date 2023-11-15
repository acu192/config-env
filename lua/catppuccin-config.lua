return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = function()
    -- Catppuccin has four themes:
    --   light: catppuccin-latte
    --   dark:  catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
    -- See: https://github.com/catppuccin/nvim
    vim.cmd.colorscheme "catppuccin-mocha"
    return {
      integrations = {
        treesitter = true,
        which_key = true,
        -- TODO: others?
      },
    }
  end,
}
