-- NOTE: NvChad Related Highlights
-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
  ["@comment"] = { italic = true },
  -- Search = { fg = "black", bg = "blue" },
  -- IncSearch = { fg = "black", bg = "red" },
  -- CurSearch = { fg = "black", bg = "blue" },
  -- Substitute = { fg = "black", bg = "green" },
  NvDashAscii = { bg = "NONE", fg = "blue" },
  NvDashButtons = { bg = "NONE" },
  FoldColumn = { bg = "NONE" },
  LspReferenceRead = { link = "Underlined" },
  LspReferenceText = { link = "Underlined" },
  LspReferenceWrite = { link = "Underlined" },
  TbFill = { link = "Normal" },
  NvimTreeRootFolder = { link = "NvimTreeFolderName" },
  -- NvimTreeOpenedFolderName = { fg = "grey" },
  -- NvimTreeFolderName = { fg = "light_grey" },
  -- NvimTreeFolderIcon = { fg = "light_grey" },
}

---@type HLTable
M.add = {
  -- WinBar = { fg = "foregroundColor", bg = "backgroundColor" },
  -- WinBarNC = { fg = "grey_fg", bg = "backgroundColor" },
  -- DiffviewDiffAdd = { fg = "black", bg = "vibrant_green" },
  -- DiffviewDiffChange = { fg = "black", bg = "yellow" },
  -- DiffviewDiffDelete = { fg = "black", bg = "red" },
  -- DiffviewDiffAddAsDelete = { fg = "black", bg = "red" },
  LspInlayHint = { fg = "infoForeground", italic = true },
  CursorLine = { bg = "selectionBackground" },
  Visual = { bg = "selectionBackground" },
  NotifyBackground = { bg = "black" },

  NeoTreeDirectoryIcon = { fg = "light_grey" },
  NeoTreeDirectoryName = { fg = "light_grey" },
  SnacksNormal = { bg = "darker_black" },
  SnacksPickerPreviewTitle = {
    fg = "black",
    bg = "green",
  },
  SnacksTitle = {
    fg = "black",
    bg = "red",
  },
  -- SnacksPickerSelected = { bg = "darker_black", fg = "green" },
  -- SnacksPickerMatch = { bg = "one_bg", fg = "blue" },
  -- SnacksPickerBorder = { fg = "darker_black", bg = "darker_black" },
  NoiceLspProgressTitle = { fg = "light_grey" },
  SnacksPickerDir = { fg = "light_grey" },
}

return M
