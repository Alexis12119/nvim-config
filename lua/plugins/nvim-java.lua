---@type NvPluginSpec
-- NOTE: For Java
return {
  "nvim-java/nvim-java",
  event = "VeryLazy",
  config = function()
    require("java").setup()
    require("lspconfig").jdtls.setup {
      on_attach = require("plugins.lsp.opts").on_attach,
      capabilities = require("plugins.lsp.opts").capabilities,
    }
  end,
}
