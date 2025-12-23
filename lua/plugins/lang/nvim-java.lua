---@type LazySpec
-- NOTE: For Java Development
return {
  {
    "nvim-java/nvim-java",
    ft = { "java" },
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        opts = {
          servers = {
            jdtls = {
              -- Your custom jdtls settings goes here
              capabilities = require("blink.cmp").get_lsp_capabilities(),
            },
          },
          setup = {
            jdtls = function()
              require("java").setup({
                -- Your custom nvim-java configuration goes here
                spring_boot_tools = {
                  enable = false,
                  version = "1.63.0",
                },
                jdk = {
                  auto_install = false,
                  version = "21",
                },
              })
            end,
          },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    enabled = false,
  },
}
