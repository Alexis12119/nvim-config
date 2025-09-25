---@type NvPluginSpec
-- NOTE: Show Better Diagnostic Inline
return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach",
  priority = 1000,
  opts = {
    throttle = 0,
    enable_on_insert = true,
  },
}
