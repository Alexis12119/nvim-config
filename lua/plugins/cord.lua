---@type NvPluginSpec
-- NOTE: Discord Rich Presence
return {
  "vyfor/cord.nvim",
  build = ":Cord update",
  lazy = false,
  config = function()
    require("cord").setup()
  end,
}
