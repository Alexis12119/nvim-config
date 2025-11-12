---@type LazySpec
-- NOTE: For Flutter Development
return {
  "akinsho/flutter-tools.nvim",
  ft = "dart",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    lsp = {
      on_attach = function(client, bufnr)
        return require("lazyvim.util.lsp").on_attach(client, bufnr)
      end,
      capabilities = function()
        return require("blink.cmp").get_lsp_capabilities()
      end,
    },
    setting = {
      analysisExcludedFolders = {
        vim.g.is_windows and vim.fn.expand("$HOME/AppData/Local/Pub/Cache") or nil,
      },
    },
  },
}
