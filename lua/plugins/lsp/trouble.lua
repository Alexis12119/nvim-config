---@type LazySpec
-- NOTE: Diagnostics UI
return {
  "folke/trouble.nvim",
  -- opts will be merged with the parent spec
  opts = {
    use_diagnostic_signs = true,
    focus = true, -- Focus the window when opened
  },
  event = "VeryLazy",
}
