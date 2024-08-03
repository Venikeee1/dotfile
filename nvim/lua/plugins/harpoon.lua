return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require "harpoon"

    harpoon.setup {
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
        key = function() return vim.loop.cwd() end,
      },
    }

    vim.keymap.set("n", "<leader>ha", function()
      harpoon:list():append()
      vim.notify("Added: " .. vim.fn.expand "%:p:t", "success")
    end)

    vim.keymap.set(
      "n",
      "<leader>hh",
      function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "Open harpoon window" }
    )

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end)
  end,
}
