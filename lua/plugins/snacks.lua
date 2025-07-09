return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		scroll = { enabled = true },
		explorer = {
			enabled = true,
		},
		lazygit = {
			enabled = true,
		},
		picker = { enabled = true },
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		-- bigfile = { enabled = true },
		-- dashboard = { enabled = true },
		-- indent = { enabled = true },
		-- input = { enabled = true },
		-- notifier = { enabled = true },
		-- quickfile = { enabled = true },
		-- scope = { enabled = true },
		-- statuscolumn = { enabled = true },
		-- words = { enabled = true },
	},
	keys = {
		-- rename file
		{
			"<leader>cR",
			function()
				Snacks.rename.rename_file()
			end,
			desc = "Rename File",
		},
		-- explorer tree
		{
			"<leader>ee",
			function()
				Snacks.explorer()
			end,
			desc = "toggle explorer",
		},
		{
			"<leader>er",
			function()
				Snacks.explorer.reveal()
			end,
			desc = "reveal in explorer",
		},
		-- lazygit
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		-- search
		{
			"<leader>sM",
			function()
				Snacks.picker.man()
			end,
			desc = "Man Pages",
		},
	},
}
