return {
  "lewis6991/gitsigns.nvim",
  requires = { "nvim-lua/plenary.nvim" },
  config = function()
    require("gitsigns").setup {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      numhl = false,
      -- linehl = false,
      -- keymaps = {
      --   noremap = true,
      --   buffer = true,
      --   ["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
      --   ["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },
      --   ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      --   ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
      --   ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      --   ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      --   ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
      -- },
    }
  end,
}
