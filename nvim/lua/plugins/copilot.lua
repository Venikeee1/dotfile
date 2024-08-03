-- return {
--   "zbirenbaum/copilot.lua",
--   cmd = "Copilot",
--   event = "InsertEnter",
--   config = function()
--     require("copilot").setup {
--       suggestion = { enabled = true },
--       panel = { enabled = true },
--     }
--   end,
-- }

-- return {
--   "github/copilot.vim",
--   init = function() vim.g.copilot_no_tab_map = true end,
--   config = function()
--     require("copilot").setup()
--
--     vim.keymap.set("i", "<C-e>", [[copilot#Accept("\<CR>")]], {
--       silent = true,
--       expr = true,
--       script = true,
--       replace_keycodes = false,
--     })
--   end,
-- }
--
return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup {
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
        },
        layout = {
          position = "right", -- | top | left | right
          ratio = 0.4,
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          open = "<C-s-e>",
          accept = "<C-E>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
      copilot_node_command = "node", -- Node.js version must be > 18.x
      server_opts_overrides = {},
    }
  end,
}
