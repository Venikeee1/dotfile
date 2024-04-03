local function filter(arr, fn)
  if type(arr) ~= "table" then return arr end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then table.insert(filtered, v) end
  end

  return filtered
end

local function filterReactDTS(value) return string.match(value.filename, "react/index.d.ts") == nil end

local function on_list(options)
  -- [https://github.com/typescript-language-server/typescript-language-server/issues/216](https://github.com/typescript-language-server/typescript-language-server/issues/216)
  local items = options.items
  if #items > 1 then items = filter(items, filterReactDTS) end

  vim.fn.setqflist({}, " ", { title = options.title, items = items, context = options.context })
  vim.api.nvim_command "cfirst"
end

return {
  {
    "williamboman/mason.nvim",
    config = function() require("mason").setup() end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "tsserver", "html", "phpactor" },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require "lspconfig"
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
      }
      lspconfig.tsserver.setup {
        capabilities = capabilities,
      }
      lspconfig.phpactor.setup {
        capabilities = capabilities,
      }

      -- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      --   update_in_insert = true,
      -- })

      -- vim.diagnostic.config {
      --   virtual_text = false,
      -- }

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>ld", vim.lsp.buf.type_definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition { on_list = on_list } end, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
      vim.keymap.set("n", "<leader>fad", vim.diagnostic.setqflist)
    end,
  },
}
