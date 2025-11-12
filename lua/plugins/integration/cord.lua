---@type LazySpec
-- NOTE: Discord Rich Presence
return {
  "vyfor/cord.nvim",
  build = ":Cord update",
  event = "VeryLazy",
  config = function()
    require("cord").setup()
  end,
}
