return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },

  config = function()
    local null_ls = require "null-ls"
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local builtins = null_ls.builtins

    null_ls.setup {
      sources = {
        builtins.formatting.stylua,
        builtins.formatting.prettier,
        require "none-ls.code_actions.eslint_d",
        require "none-ls.diagnostics.eslint_d",
      },
      virtual_text = false,
      -- you can reuse a shared lspconfig on_attach callback here
      on_attach = function(client, bufnr)
        if client.supports_method "textDocument/formatting" then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
              -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
              vim.lsp.buf.format {
                async = false,
                filter = function(client) return client.name == "null-ls" end,
              }
            end,
          })
        end
      end,
    }

    vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format { async = true } end, {})
  end,
}
