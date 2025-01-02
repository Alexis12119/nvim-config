---@type NvPluginSpec
-- NOTE: For Typescript
return {
  "pmizio/typescript-tools.nvim",
  event = "VeryLazy",
  opts = {
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
      require("plugins.lsp.opts").on_attach(client, bufnr)
    end,
    settings = {
      separate_diagnostic_server = false, -- Disable separate diagnostic server
      tsserver_file_preferences = {
        includeInlayParameterNameHints = "all",
        includeCompletionsForModuleExports = true,
        quotePreference = "auto",
      },
    },
  },
}
