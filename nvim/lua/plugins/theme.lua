-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   transparent = true,
--   opts = {
--     transparent = true,
--     transparent_background = true,
--   },
--   config = function()
--     require("tokyonight").setup {}
--     vim.cmd.colorscheme "tokyonight"
--   end,
-- }

return {
  "craftzdog/solarized-osaka.nvim",
  lazy = true,
  priority = 1000,
  transparent = true,
  opts = {
    transparent = true,
    transparent_background = true,
  },
  sidebars = {},
  config = function()
    require("solarized-osaka").setup {
      on_colors = function(colors)
        colors.bg_sidebar = colors.none
        colors.bg_float = colors.none
      end,
    }
  end,
}

-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--   config = function()
--     require("catppuccin").setup {
--       flavour = "Macchiato",
--     }
--     vim.cmd.colorscheme "catppuccin"
--   end,
-- }
