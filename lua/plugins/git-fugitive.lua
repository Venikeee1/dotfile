return {
	"tpope/vim-fugitive",
	config = function()
		vim.api.nvim_set_keymap("n", "<leader>gs", ":Git<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>gc", ":Git commit<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>gp", ":Git push<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>gl", ":Git log<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>gd", ":Gdiff<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>gb", ":Git blame<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>gj", ":Gedit<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>gr", ":Gread<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>gw", ":Gwrite<CR>", { noremap = true, silent = true })
	end,
}
