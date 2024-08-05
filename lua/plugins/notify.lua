return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")

		notify.setup({
			max_width = 70,
		})
		vim.notify = require("notify")
	end,
}
