return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"zbirenbaum/copilot-cmp",
		},
		config = function()
			local cmp = require("cmp")
			-- require("copilot_cmp").setup()
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				-- formatting = {
				--   format = vim.lspkind.cmp_format {
				--     mode = "symbol",
				--     max_width = 50,
				--     symbol_map = { Copilot = "" },
				--   },
				-- },
				sources = cmp.config.sources({
					{ name = "copilot" },
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
	{
		"L3MON4D3/LuaSnip",
	},
	{
		"saadparwaiz1/cmp_luasnip",
	},
}
