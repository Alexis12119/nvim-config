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
    cmd = {
      "Bdelete",
      "Bwipeout",
    },
  },
  {
    "luarocks/hererocks", -- For not being deleted. lazy.nvim will use it.
    priority = 10000,
    optional = true,
  },
}
