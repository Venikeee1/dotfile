return {
	"mistricky/codesnap.nvim",
	lazy = true,
	build = "make",
	version = "^1",
	keys = {
		{ "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
		{ "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
	},
	config = function()
		require("codesnap").setup({
			watermark = "",
		})
	end,
}
