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
          vim.env.VIMRUNTIME,
          vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
        },
        checkThirdParty = false,
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}
