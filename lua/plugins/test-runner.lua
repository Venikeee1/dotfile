return {
  "vim-test/vim-test",
  config = function()
    local wk = require "which-key"
    vim.cmd "let test#strategy = 'neovim'"

    wk.register({
      ["tt"] = { ":TestNearest<CR>", "Test nearest block" },
      ["ts"] = { ":TestSuite<CR>", "Runs the whole test suite " },
      ["tl"] = { ":TestLast<CR>", "Run last test" },
      ["tf"] = { ":TestFile<CR>", "Run  in file" },
      ["tr"] = { ":TestVisit<CR>", "Visits the test file from which you last run your tests" },
    }, { prefix = "<leader>" })
  end,
}

-- <cmd>botright vs<cr><cmd>
