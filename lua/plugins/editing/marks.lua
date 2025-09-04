---@type NvPluginSpec
-- NOTE: Show Marks
return {
  "chentoast/marks.nvim",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  opts = {},
}
