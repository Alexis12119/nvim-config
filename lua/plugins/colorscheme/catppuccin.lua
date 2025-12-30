---@type LazySpec
-- NOTE: Catppuccin
return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    custom_highlights = function(colors)
      return {
        DiffviewDiffDelete = { bg = "#422b2b", fg = "#422b2b" },
        LspReferenceRead = { link = "Underlined" },
        LspReferenceText = { link = "Underlined" },
        LspReferenceWrite = { link = "Underlined" },
        SnacksPickerDir = { fg = colors.text },
      }
    end,
  },
  priority = 1000,
}
