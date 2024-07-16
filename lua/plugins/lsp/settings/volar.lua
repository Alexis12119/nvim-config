return {
  settings = {
    init_options = {
      vue = {
        hybridMode = true,
      },
      typescript = {
        tsdk = vim.fn.stdpath "data" .. "/mason/packages/vue-language-server/node_modules/typescript/lib",
      },
    },
    languageFeatures = {
      implementation = true,
      references = true,
      definition = true,
      typeDefinition = true,
      callHierarchy = true,
      hover = true,
      rename = true,
      renameFileRefactoring = true,
      signatureHelp = true,
      codeAction = true,
      workspaceSymbol = true,
      diagnostics = true,
      semanticTokens = false,
    },
  },
}
