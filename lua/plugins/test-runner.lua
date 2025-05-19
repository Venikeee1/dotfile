return {
	"vim-test/vim-test",
	config = function()
		local wk = require("which-key")
		vim.cmd("let test#strategy = 'neovim'")

		wk.add({
			{ "<leader>tt", ":TestNearest<CR>", desc = "Test nearest block" },
			{ "<leader>ts", ":TestSuite<CR>", desc = "Runs the whole test suite " },
			{ "<leader>tl", ":TestLast<CR>", desc = "Run last test" },
			{ "<leader>tf", ":TestFile<CR>", desc = "Run  in file" },
			{ "<leader>tr", ":TestVisit<CR>", desc = "Visits the test file from which you last run your tests" },
		})
	end,
}
