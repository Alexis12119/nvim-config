---@type NvPluginSpec
-- NOTE: Screensaver plugins
-- But it's WIP
return {
  "tamton-aquib/zone.nvim",
  enabled = false,
  event = "VeryLazy",
  opts = {
    after = 60, -- Seconds
  },
}
