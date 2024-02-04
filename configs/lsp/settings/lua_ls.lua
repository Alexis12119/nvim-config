return {
  settings = {
    Lua = {
      semantic = {
        enable = false,
      },
      hint = { enable = true },
      diagnostics = {
        globals = { "vim" },
      },
      telemetry = { enable = false },
      workspace = {
        library = {
          vim.api.nvim_get_runtime_file("", true),
          vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
        },
        checkThirdParty = false,
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}
