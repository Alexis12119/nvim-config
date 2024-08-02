-- NOTE: NvChad Related Highlights
-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    fg = "light_grey",
    italic = true,
  },
  ["@comment"] = { fg = "light_grey", italic = true },
  Search = { fg = "black", bg = "blue" },
  IncSearch = { fg = "black", bg = "red" },
  CurSearch = { fg = "black", bg = "blue" },
  Substitute = { fg = "black", bg = "green" },
  FoldColumn = { bg = "NONE" },
  LspReferenceRead = { link = "Underlined" },
  LspReferenceText = { link = "Underlined" },
  LspReferenceWrite = { link = "Underlined" },
  TblineFill = { link = "Normal" },
  NvimTreeRootFolder = { link = "NvimTreeFolderName" },
  gitcommitComment = { link = "Comment", fg = "grey_fg2" },

  -- User style
  NvDashAscii = { bg = "blue", fg = "black" },
  NvDashButtons = { bg = "black2", fg = "white" },

  -- WARN: Only suitable while using catppuccin. Consider to remove if use another theme.
  TbFill = { bg = "NONE" },
  Visual = {
    bg = "one_bg2",
  },
  TelescopeSelection = { bg = "one_bg2" },
  TelescopeMatching = { bg = "NONE" },
}

---@type HLTable
M.add = {
  WinBar = { link = "Normal" },
  WinBarNC = { link = "Normal" },
  DiffviewDiffAdd = { fg = "black", bg = "green" },
  DiffviewDiffChange = { fg = "black", bg = "green" },
  DiffviewDiffDelete = { fg = "black", bg = "red" },
  DiffviewDiffAddAsDelete = { fg = "black", bg = "red" },
  LspInlayHint = { link = "Comment" },
}

return M
