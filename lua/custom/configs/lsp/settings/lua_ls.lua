return {
  settings = {
    Lua = {
      semantic = {
        enable = false,
      },
      diagnostics = {
        globals = { "vim" },
      },
      telemetry = { enable = false },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
          -- [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          -- [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
          -- [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
      },
    },
  },
}
