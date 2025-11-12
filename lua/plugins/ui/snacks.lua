---@type LazySpec
-- NOTE: QoL Plugins
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    { "<leader>e", false },
    { "<leader>E", false },
  },
}
