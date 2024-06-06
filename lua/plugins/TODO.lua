-- TODO name something
return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("todo-comments").setup({
			signs = true,
			keywords = {
				FIXME = { icon = " ", color = "error" },
				TODO = { icon = " ", color = "info" },
				HACK = { icon = " ", color = "warning" },
				WARNING = { icon = " ", color = "warning" },
				INFO = { icon = " ", color = "info" },
				NOTE = { icon = " ", color = "hint" },
			},
			highlight = {
				before = "",
				keyword = "wide",
				after = "fg",
			},
			search = {
				command = "rg",
				args = {
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
				},
				pattern = [[\b(KEYWORDS):]],
			},
		})
	end,
}
