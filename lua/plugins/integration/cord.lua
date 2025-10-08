---@type NvPluginSpec
-- NOTE: Discord Rich Presence
return {
  "vyfor/cord.nvim",
  build = ":Cord update",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("cord").setup()
  end,
}
