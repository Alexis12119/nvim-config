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
    cmd = { "Bdelete", "Bwipeout" },
  },
  -- Add Luarocks support for lazy.nvim
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
}
