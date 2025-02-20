---@type NvPluginSpec
-- NOTE: For Flutter Development
return {
  "akinsho/flutter-tools.nvim",
  ft = "dart",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
  opts = {
    lsp = {
      on_attach = require("plugins.lsp.opts").on_attach,
      capabilities = require("plugins.lsp.opts").capabilities,
    },
  },
}
