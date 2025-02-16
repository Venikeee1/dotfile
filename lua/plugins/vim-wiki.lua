return {
	"vimwiki/vimwiki",
	config = function()
		local wk = require("which-key")
		wk.register({
			w = {
				name = "vimwiki",
				w = { "<cmd>botright vs<cr><cmd>VimwikiIndex<cr>", "Open viki" },
			},
		}, { prefix = "<leader>" })
	end,
}
