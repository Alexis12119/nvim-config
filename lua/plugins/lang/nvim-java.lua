---@type LazySpec
-- NOTE: For Java Development
return {
  {
    "nvim-java/nvim-java",
    ft = { "java" },
    opts = {},
    config = function(_, opts)
      require("java").setup(opts)
      require("lspconfig").jdtls.setup({
        on_attach = require("lazyvim.util.lsp").on_attach(),
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    enabled = false,
  },
}
