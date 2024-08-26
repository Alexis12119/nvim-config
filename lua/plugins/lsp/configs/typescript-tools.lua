---@type NvPluginSpec
-- NOTE: For Typescript
return {
  "pmizio/typescript-tools.nvim",
  event = "BufReadPost",
  opts = {
    on_attach = function(client)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
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
