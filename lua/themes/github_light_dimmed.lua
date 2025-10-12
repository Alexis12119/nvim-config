-- Credits: https://github.com/projekt0n/github-nvim-theme
local M = {}

M.base_30 = {
  white = "#24292e",
  black = "#ffffff", -- background
  darker_black = "#f6f8fa",
  black2 = "#eaeef2",
  one_bg = "#f6f8fa", -- main bg
  one_bg2 = "#eaeef2", -- side panels
  one_bg3 = "#d0d7de",
  grey = "#768390",
  grey_fg = "#6e7781",
  grey_fg2 = "#8c959f",
  light_grey = "#9aa2ab",
  red = "#cf222e",
  baby_pink = "#fa4549",
  pink = "#bf3989",
  line = "#eaeef2",
  green = "#116329",
  vibrant_green = "#22863a",
  nord_blue = "#0550ae",
  blue = "#0969da",
  seablue = "#1f6feb",
  yellow = "#953800",
  sun = "#e36209",
  purple = "#8250df",
  dark_purple = "#6639ba",
  teal = "#1b7c83",
  orange = "#d18616",
  cyan = "#1b7c83",
  statusline_bg = "#f6f8fa",
  lightbg = "#eaeef2",
  pmenu_bg = "#0969da",
  folder_bg = "#6e7781",
}

M.base_16 = {
  base00 = M.base_30.black,
  base01 = M.base_30.black2,
  base02 = M.base_30.one_bg2,
  base03 = M.base_30.one_bg3,
  base04 = M.base_30.grey_fg2,
  base05 = M.base_30.white,
  base06 = "#57606a",
  base07 = "#24292e",
  base08 = M.base_30.red,
  base09 = M.base_30.orange,
  base0A = "#953800",
  base0B = M.base_30.vibrant_green,
  base0C = M.base_30.teal,
  base0D = M.base_30.blue,
  base0E = M.base_30.purple,
  base0F = M.base_30.baby_pink,
}

M.polish_hl = {
  defaults = {
    LineNr = { fg = M.base_30.grey_fg2 },
    CursorLineNr = { fg = M.base_30.blue, bold = true },
    Search = { fg = M.base_30.white, bg = "#dbe9f9" },
    IncSearch = { fg = M.base_30.white, bg = M.base_30.blue },
    CurSearch = { fg = M.base_30.white, bg = M.base_30.blue },
    Substitute = { fg = M.base_30.white, bg = "#dbe9f9" },

    -- DiffView (WebStorm-style light variant)
    DiffAdd = { bg = "#dbeddb", fg = "#116329" },
    DiffDelete = { bg = "#ffdce0", fg = "#cf222e" },
    DiffChange = { bg = "#e7ecff", fg = "#0550ae" },
    DiffText = { bg = "#c8dafc", fg = M.base_30.white, bold = true },

    -- Diffview.nvim custom groups
    DiffviewDiffAdd = { bg = "#dbeddb" },
    DiffviewDiffDelete = { bg = "#ffdce0" },
    DiffviewDiffChange = { bg = "#e7ecff" },
    DiffviewDiffText = { bg = "#c8dafc", bold = true },
  },

  treesitter = {
    ["@comment"] = { fg = M.base_30.grey, italic = true },
    ["@keyword"] = { fg = M.base_30.red },
    ["@keyword.function"] = { fg = M.base_30.red },
    ["@function"] = { fg = M.base_30.blue },
    ["@function.builtin"] = { fg = M.base_30.blue },
    ["@string"] = { fg = "#0a3069" },
    ["@number"] = { fg = M.base_30.orange },
    ["@boolean"] = { fg = M.base_30.orange },
    ["@type"] = { fg = "#116329" },
    ["@constant"] = { fg = M.base_30.blue },
    ["@property"] = { fg = M.base_30.white },
    ["@variable"] = { fg = M.base_30.white },
    ["@variable.builtin"] = { fg = "#953800" },
  },
}

M.type = "light"

M = require("base46").override_theme(M, "github_light_dimmed")

return M
