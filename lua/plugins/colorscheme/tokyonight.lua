---@type LazySpec
-- NOTE: Tokyonight

return {
  "folke/tokyonight.nvim",
  opts = {
    style = "night",
    on_highlights = function(hl, _)
      hl.DiffviewDiffDelete = { bg = "#422b2b", fg = "#422b2b" }
    end,
  },
}
