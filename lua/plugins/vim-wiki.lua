return {
	"vimwiki/vimwiki",
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>ww", "<cmd>botright vs<cr><cmd>VimwikiIndex<cr>", desc = "Open wiki" },
		})
	end,
}
