return {
	"mistricky/codesnap.nvim",
	lazy = true,
	build = "make",
	version = "^1",
	config = function()
		require("codesnap").setup({
			watermark = "Venik",
		})
	end,
}
