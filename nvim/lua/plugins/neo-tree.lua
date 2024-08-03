return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>ef", ":Neotree filesystem reveal current<CR>", {})
		vim.keymap.set("n", "<leader>ee", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>ec", ":Neotree close<CR>", {})

		require("neo-tree").setup({
			event_handlers = {
				{
					event = "file_opened",
					handler = function(file_path)
						-- auto close
						-- vimc.cmd("Neotree close")
						-- OR
						-- require("neo-tree.command").execute { action = "close" }
					end,
				},
			},
			close_if_last_window = true,
			window = {
				position = "current",
			},
		})

		vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])
	end,
}
