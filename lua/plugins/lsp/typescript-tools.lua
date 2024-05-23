-- NOTE: For Typescript
return {
  "pmizio/typescript-tools.nvim",
  opts = {
    settings = {
      tsserver_file_preferences = {
        includeInlayParameterNameHints = "all",
        includeCompletionsForModuleExports = true,
        quotePreference = "auto",
      },
    },
  },
}
