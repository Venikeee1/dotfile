return {
	"MeanderingProgrammer/render-markdown.nvim",
	opts = {},
	-- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	config = function()
		require("render-markdown").setup({
			file_types = { "markdown", "vimwiki" },
			block = {
				style = "language",
				disable_background = { "diff" },
			},
			heading = {
				backgrounds = {
					"RenderMarkdownH1Bg",
					"RenderMarkdownH2Bg",
					"RenderMarkdownH3Bg",
					"RenderMarkdownH4Bg",
					"RenderMarkdownH5Bg",
					"RenderMarkdownH6Bg",
				},
			},
		})
		vim.treesitter.language.register("markdown", "vimwiki")
	end,
}
