return {
  "mistricky/codesnap.nvim",
  build = "make",
  version = "^1",
  config = function()
    require("codesnap").setup {
      watermark = "Venik",
    }
  end,
}
