---@type NvPluginSpec
-- NOTE: Better Help
return {
  "OXY2DEV/helpview.nvim",
  lazy = false, -- Recommended

  -- In case you still want to lazy load
  -- ft = "help",

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
}
