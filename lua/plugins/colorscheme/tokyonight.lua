---@type LazySpec
-- NOTE: Tokyonight
return {
  "folke/tokyonight.nvim",
  opts = {
    style = "night",
    on_highlights = function(hl, c)
      hl.DiffviewDiffDelete = { bg = "#422b2b", fg = "#422b2b" }

      hl.LspReferenceRead = { link = "Underlined" }
      hl.LspReferenceText = { link = "Underlined" }
      hl.LspReferenceWrite = { link = "Underlined" }
      hl.SnacksPickerDir = { fg = c.fg }
    end,
  },
}
