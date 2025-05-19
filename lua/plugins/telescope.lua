return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"smartpde/telescope-recent-files",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local wk = require("which-key")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
			},
			pickers = {
				buffers = {
					ignore_current_buffer = true,
					previewer = false,
					sort_mru = true,
					sort_lastused = true,
					theme = "cursor",
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})

		wk.add({
			{
				"<leader>ff",
				function(args)
					builtin.find_files(args)
				end,
				desc = "Find files",
			},
			{
				"<leader>fg",
				function()
					builtin.live_grep({ additional_args = { "--fixed-strings" } })
				end,
				desc = "Live grep",
			},
			{
				"<leader>fj",
				function(args)
					builtin.live_grep(args)
				end,
				desc = "Live grep with regex",
			},
			{
				"<leader>ft",
				function(args)
					builtin.tags(args)
				end,
				desc = "Tags",
			},
			{
				"<leader>fb",
				function(args)
					builtin.buffers(args)
				end,
				desc = "Show buffers",
			},
			{
				"<leader>fs",
				function()
					builtin.resume()
				end,
				desc = "Open prev search",
			},
			{
				"<leader>fj",
				function()
					builtin.grep_string()
				end,
				desc = "Grep strings",
			},
			{
				"<leader>fjj",
				function()
					builtin.grep_string({ search = "" })
				end,
				desc = "Global Grep strings",
			},
			{
				"<leader>fi",
				function(args)
					builtin.current_buffer_fuzzy_find(args)
				end,
				desc = "Search in current file",
			},
			{
				"<leader>rr",
				function(args)
					builtin.registers(args)
				end,
				desc = "Registers",
			},
			{
				"<leader>fr",
				function(args)
					telescope.extensions.recent_files.pick(args)
				end,
				desc = "Recent files",
			},
			-- {
			-- 	"<leader>fr",
			-- 	function(args)
			-- 		builtin.oldfiles(args)
			-- 	end,
			-- 	desc = "Old files",
			-- },
			{
				"<leader>gs",
				function(args)
					builtin.git_status(args)
				end,
				desc = "Git status",
			},
			{
				"<leader>gbb",
				function(args)
					builtin.git_branches(args)
				end,
				desc = "Git branches",
			},
			{
				"<leader>dn",
				function(args)
					vim.diagnostic.goto_next(args)
				end,
				desc = "Next diagnostic",
			},
			{
				"<leader>dp",
				function(args)
					vim.diagnostic.goto_prev(args)
				end,
				desc = "Previous diagnostic",
			},
			{
				"<leader>df",
				function()
					vim.diagnostic.open_float({ scope = "b", border = "rounded" })
				end,
				desc = "Open float diagnostic",
			},
			{
				"<leader>dd",
				function()
					vim.diagnostic.open_float({
						border = "rounded",
					})
				end,
				desc = "Open diagnostic for line",
			},
			{
				"<leader>da",
				function(args)
					builtin.diagnostics(args)
				end,
				desc = "show diannostics in projesct",
			},
			{
				"<leader>dq",
				function(args)
					builtin.quickfix(args)
				end,
				desc = "Set qflist",
			},
		})

		wk.add({
			{
				"gr",
				function(args)
					builtin.lsp_references(args)
				end,
				desc = "LSP References",
			},
			{
				"z=",
				function(args)
					builtin.spell_suggest(args)
				end,
				desc = "Spell suggest",
			},
		})
	end,
}
