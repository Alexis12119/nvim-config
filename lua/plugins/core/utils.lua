---@type NvPluginSpec
-- NOTE: Utility plugins
return {
  -- Utilities
  {
    "nvim-lua/plenary.nvim",
  },
  -- Schemas
  { "b0o/schemastore.nvim" },
  -- Buffer Delete
  {
    "moll/vim-bbye",
    enabled = false,
    cmd = { "Bdelete", "Bwipeout" },
  },
}
