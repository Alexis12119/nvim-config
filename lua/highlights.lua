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
}

return M
