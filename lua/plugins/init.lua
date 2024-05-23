-- NOTE: Default Plugins
return {
  -- NvChad Default Terminal
  {
    "NvChad/nvterm",
    enabled = false,
  },
  { import = "plugins.lsp" },
  { import = "plugins.dap" },
}
