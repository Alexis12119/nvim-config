---@type NvPluginSpec
-- NOTE: Surround "", {}, '', ()
return {
  "kylechui/nvim-surround",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  opts = {},
}
