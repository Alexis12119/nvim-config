---@type NvPluginSpec
-- NOTE: For Typescript
-- For further information: https://github.com/typescript-language-server/typescript-language-server/blob/HEAD/docs/configuration.md
return {
  "pmizio/typescript-tools.nvim",
  event = "User FilePost",
  opts = {
    on_attach = function(client)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end,
    settings = {
      expose_as_code_action = {
        "fix_all",
        "sort_imports", -- I don't know why it doesn't work now
      },
      tsserver_file_preferences = {
        includeCompletionsForModuleExports = true,
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
        preferGoToSourceDefinition = true,
        quotePreference = "auto",
      },
    },
  },
}
