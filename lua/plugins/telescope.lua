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
					sort_mru = true,
					sort_lastused = true,
					theme = "dropdown",
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})

		wk.register({
			f = {
				name = "file", -- optional group name
				f = {
					function(args)
						builtin.find_files(args)
					end,
					"Find files",
				},
				g = {
					function(args)
						builtin.live_grep(args)
					end,
					"Live grep",
				},
				t = {
					function(args)
						builtin.tags(args)
					end,
					"Tags",
				},
				b = {
					function(args)
						builtin.buffers(args)
					end,
					"Show buffers",
				},
				s = {
					function()
						builtin.resume()
					end,
					"Open prev search",
				},
				j = {
					function()
						builtin.grep_string()
					end,
					"Search string",
				},
				["jj"] = {
					function()
						builtin.grep_string({ search = "" })
					end,
					"Search string",
				},
				i = {
					function(args)
						builtin.current_buffer_fuzzy_find(args)
					end,
					"Search in current file",
				},
			},
			["rr"] = {
				function(args)
					builtin.registers(args)
				end,
				"Registers",
			},
			["frf"] = {
				function(args)
					telescope.extensions.recent_files.pick(args)
				end,
				"Recent files",
			},
			["fr"] = {
				function(args)
					builtin.oldfiles(args)
				end,
				"Old files",
			},
			g = {
				name = "Git",
				s = {
					function(args)
						builtin.git_status(args)
					end,
					"Git status",
				},
				["bb"] = {
					function(args)
						builtin.git_branches(args)
					end,
					"Git branches",
				},
			},
			d = {
				name = "Diagnostic",
				n = {
					function(args)
						vim.diagnostic.goto_next(args)
					end,
					"Next diagnostic",
				},
				p = {
					function(args)
						vim.diagnostic.goto_prev(args)
					end,
					"Previous diagnostic",
				},
				f = {
					function()
						vim.diagnostic.open_float({ scope = "b" })
					end,
					"Open float diagnostic",
				},
				d = {
					function()
						vim.diagnostic.open_float({})
					end,
					"Open diagnostic for line",
				},
				a = {
					function(args)
						builtin.diagnostics(args)
					end,
					"show diannostics in projesct",
				},
				q = {
					function(args)
						builtin.quickfix(args)
					end,
					"Set qflist",
				},
			},
		}, { prefix = "<leader>" })

		wk.register({
			["gr"] = {
				name = "file",
				function(args)
					builtin.lsp_references(args)
				end,
				"LSP References",
			},
			z = {
				name = "Spell",
				["="] = {
					function(args)
						builtin.spell_suggest(args)
					end,
					"Spell suggest",
				},
			},
		})
	end,
}
