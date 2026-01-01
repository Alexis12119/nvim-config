---@type LazySpec
-- NOTE: For Java Development
return {
  {
    "nvim-java/nvim-java",
    ft = { "java" },
    config = function()
      require("java").setup()
      vim.lsp.enable("jdtls")
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    enabled = false,
  },
}
