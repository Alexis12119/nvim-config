-- Credits: https://github.com/projekt0n/github-nvim-theme
local M = {}

M.base_30 = {
  white = "#adbac7",
  black = "#1e2228", -- darker, closer to GitHub dark dimmed
  darker_black = "#191d23", -- base background
  black2 = "#24292f", -- side panels
  one_bg = "#24292f", -- folder/sidebar
  one_bg2 = "#2b3137",
  one_bg3 = "#363b42",
  grey = "#4c566a",
  grey_fg = "#586270",
  grey_fg2 = "#636e7b",
  light_grey = "#768390",
  red = "#f47067",
  baby_pink = "#ff938a",
  pink = "#dcbdfb",
  line = "#2b3137",
  green = "#6bc46d",
  vibrant_green = "#57ab5a",
  nord_blue = "#6cb6ff",
  blue = "#6cb6ff",
  seablue = "#76e3ea",
  yellow = "#e3b341",
  sun = "#f1c232",
  purple = "#b083f0",
  dark_purple = "#986ee2",
  teal = "#39c5cf",
  orange = "#e07b39",
  cyan = "#76e3ea",
  statusline_bg = "#24292f", -- statusline background
  lightbg = "#2b3137",
  pmenu_bg = "#316dca",
  folder_bg = "#768390",
}

-- Reuse base_30 values for base_16
M.base_16 = {
  base00 = M.base_30.black,
  base01 = M.base_30.black2,
  base02 = M.base_30.one_bg2,
  base03 = M.base_30.one_bg3,
  base04 = M.base_30.grey_fg2,
  base05 = M.base_30.white,
  base06 = "#cdd9e5",
  base07 = "#dbe2eb",
  base08 = M.base_30.red,
  base09 = M.base_30.orange,
  base0A = M.base_30.yellow,
  base0B = M.base_30.vibrant_green,
  base0C = M.base_30.teal,
  base0D = M.base_30.blue,
  base0E = M.base_30.purple,
  base0F = M.base_30.baby_pink,
}

M.polish_hl = {
  defaults = {
    LineNr = { fg = M.base_30.grey },
    CursorLineNr = { fg = M.base_30.blue, bold = true },
    Search = { fg = M.base_30.white, bg = M.base_30.one_bg3 },
    IncSearch = { fg = M.base_30.black, bg = M.base_30.blue },
    CurSearch = { fg = M.base_30.black, bg = M.base_30.blue },
    Substitute = { fg = M.base_30.white, bg = M.base_30.one_bg3 },

    -- DiffView syntax highlights (WebStorm-style)
    DiffAdd = { bg = "#244032", fg = M.base_30.green },
    DiffDelete = { bg = "#422b2b", fg = M.base_30.red },
    DiffChange = { bg = "#143D79", fg = M.base_30.blue },
    DiffText = { bg = "#314c72", fg = M.base_30.white, bold = true }, -- highlight inside changed line

    -- Diffview.nvim custom groups
    DiffviewDiffAdd = { bg = "#244032" },
    DiffviewDiffDelete = { bg = "#422b2b", fg = "#422b2b" },
    DiffviewDiffChange = { bg = "#2b3240" },
    DiffviewDiffText = { bg = "#314c72", bold = true },

    -- Inline diff markers
    DiffAddAsDelete = { bg = "#422b2b", fg = M.base_30.red },
    DiffDeleteText = { bg = "#422b2b", fg = M.base_30.red },
    DiffChangeDelete = { bg = "#2b3240", fg = M.base_30.blue },
  },

  treesitter = {
    ["@comment"] = { fg = M.base_30.light_grey, italic = true },
    ["@keyword"] = { fg = M.base_30.red },
    ["@keyword.function"] = { fg = M.base_30.red },
    ["@function"] = { fg = M.base_30.blue },
    ["@function.builtin"] = { fg = M.base_30.blue },
    ["@string"] = { fg = "#96d0ff" },
    ["@number"] = { fg = M.base_30.yellow },
    ["@boolean"] = { fg = M.base_30.yellow },
    ["@type"] = { fg = "#8ddb8c" },
    ["@constant"] = { fg = M.base_30.blue },
    ["@property"] = { fg = M.base_30.white },
    ["@variable"] = { fg = M.base_30.white },
    ["@variable.builtin"] = { fg = "#f69d50" },

    -- Python-specific Tree-sitter highlights
    ["@keyword.import.python"] = { fg = "#c8a1ff", italic = true },
    ["@keyword.global.python"] = { fg = "#c8a1ff", italic = true },
    ["@keyword.return.python"] = { fg = "#c8a1ff", bold = true },
    ["@keyword.python"] = { fg = "#c8a1ff", italic = true },
    ["@keyword.function.python"] = { fg = "#c8a1ff", italic = true },

    ["@class.python"] = { fg = "#96d0ff" },
    ["@type.python"] = { fg = "#96d0ff" },
    ["@type.builtin.python"] = { fg = "#8ddb8c" },
    ["@constructor.python"] = { fg = "#6cb6ff", bold = true },

    ["@function.python"] = { fg = "#6cb6ff" },
    ["@function.builtin.python"] = { fg = "#79b8ff", italic = true },
    ["@function.call.python"] = { fg = "#6cb6ff" },

    ["@variable.parameter.python"] = { fg = "#dcbdfb" },
    ["@variable.member.python"] = { fg = "#adbac7" },
    ["@variable.builtin.python"] = { fg = "#f69d50", italic = true },
    ["@field.python"] = { fg = "#adbac7" },
    ["@property.python"] = { fg = "#adbac7" },

    ["@string.python"] = { fg = "#a5d6ff" },
    ["@string.doc.python"] = { fg = "#768390", italic = true },
    ["@constant.python"] = { fg = "#e3b341" },
    ["@constant.builtin.python"] = { fg = "#f69d50" },
    ["@number.python"] = { fg = "#e3b341" },
    ["@boolean.python"] = { fg = "#e3b341" },

    ["@operator.python"] = { fg = "#b083f0" },
    ["@punctuation.delimiter.python"] = { fg = "#768390" },
    ["@exception.python"] = { fg = "#f47067", bold = true },
    ["@conditional.python"] = { fg = "#f47067" },
    ["@repeat.python"] = { fg = "#f47067" },

    -- Java-specific Tree-sitter highlights (GitHub Dark Dimmed accurate)
    ["@keyword.import.java"] = { fg = "#c8a1ff", italic = true },
    ["@keyword.package.java"] = { fg = "#c8a1ff", italic = true },
    ["@keyword.return.java"] = { fg = "#c8a1ff", bold = true },
    ["@keyword.java"] = { fg = "#c8a1ff", italic = true },
    ["@keyword.modifier.java"] = { fg = "#c8a1ff", italic = true },

    ["@class.java"] = { fg = "#96d0ff" },
    ["@interface.java"] = { fg = "#96d0ff", italic = true },
    ["@type.java"] = { fg = "#96d0ff" },
    ["@type.builtin.java"] = { fg = "#8ddb8c" },
    ["@constructor.java"] = { fg = "#6cb6ff", bold = true },

    ["@method.call.java"] = { fg = "#6cb6ff" },
    ["@function.method.java"] = { fg = "#6cb6ff" },
    ["@function.builtin.java"] = { fg = "#79b8ff", italic = true },
    ["@function.java"] = { fg = "#6cb6ff" },

    ["@variable.parameter.java"] = { fg = "#dcbdfb" },
    ["@variable.member.java"] = { fg = "#adbac7" },
    ["@variable.builtin.java"] = { fg = "#f69d50", italic = true },
    ["@field.java"] = { fg = "#adbac7" },
    ["@property.java"] = { fg = "#adbac7" },

    ["@string.java"] = { fg = "#a5d6ff" },
    ["@constant.java"] = { fg = "#e3b341" },
    ["@constant.builtin.java"] = { fg = "#f69d50" },
    ["@number.java"] = { fg = "#e3b341" },
    ["@boolean.java"] = { fg = "#e3b341" },

    ["@annotation.java"] = { fg = "#b083f0", italic = true },
    ["@operator.java"] = { fg = "#b083f0" },
    ["@punctuation.delimiter.java"] = { fg = "#768390" },
    ["@exception.java"] = { fg = "#f47067", bold = true },
    ["@conditional.java"] = { fg = "#f47067" },
    ["@repeat.java"] = { fg = "#f47067" },

    -- JavaScript / TypeScript
    ["@keyword.import.javascript"] = { fg = "#c8a1ff", italic = true },
    ["@keyword.export.javascript"] = { fg = "#c8a1ff", italic = true },
    ["@keyword.return.javascript"] = { fg = "#c8a1ff", bold = true },
    ["@keyword.javascript"] = { fg = "#c8a1ff", italic = true },
    ["@type.javascript"] = { fg = "#96d0ff" },
    ["@type.builtin.javascript"] = { fg = "#8ddb8c" },
    ["@constructor.javascript"] = { fg = "#6cb6ff", bold = true },
    ["@function.javascript"] = { fg = "#6cb6ff" },
    ["@function.call.javascript"] = { fg = "#6cb6ff" },
    ["@function.builtin.javascript"] = { fg = "#79b8ff", italic = true },
    ["@variable.parameter.javascript"] = { fg = "#dcbdfb" },
    ["@variable.member.javascript"] = { fg = "#adbac7" },
    ["@variable.builtin.javascript"] = { fg = "#f69d50", italic = true },
    ["@string.javascript"] = { fg = "#a5d6ff" },
    ["@number.javascript"] = { fg = "#e3b341" },
    ["@boolean.javascript"] = { fg = "#e3b341" },
    ["@constant.javascript"] = { fg = "#e3b341" },
    ["@constant.builtin.javascript"] = { fg = "#f69d50" },
    ["@operator.javascript"] = { fg = "#b083f0" },
    ["@punctuation.delimiter.javascript"] = { fg = "#768390" },
    ["@conditional.javascript"] = { fg = "#f47067" },
    ["@repeat.javascript"] = { fg = "#f47067" },

    -- HTML
    ["@tag.html"] = { fg = "#6cb6ff" },
    ["@tag.attribute.html"] = { fg = "#dcbdfb" },
    ["@tag.delimiter.html"] = { fg = "#768390" },
    ["@string.html"] = { fg = "#a5d6ff" },
    ["@constant.html"] = { fg = "#e3b341" },

    -- CSS / SCSS
    ["@property.css"] = { fg = "#adbac7" },
    ["@property.id.css"] = { fg = "#96d0ff" },
    ["@property.class.css"] = { fg = "#96d0ff" },
    ["@string.css"] = { fg = "#a5d6ff" },
    ["@number.css"] = { fg = "#e3b341" },
    ["@type.css"] = { fg = "#96d0ff" },
    ["@function.css"] = { fg = "#6cb6ff" },
    ["@keyword.css"] = { fg = "#c8a1ff", italic = true },

    -- JSON / YAML
    ["@property.json"] = { fg = "#adbac7" },
    ["@string.json"] = { fg = "#a5d6ff" },
    ["@number.json"] = { fg = "#e3b341" },
    ["@boolean.json"] = { fg = "#e3b341" },
    ["@field.yaml"] = { fg = "#adbac7" },
    ["@string.yaml"] = { fg = "#a5d6ff" },
    ["@number.yaml"] = { fg = "#e3b341" },
    ["@boolean.yaml"] = { fg = "#e3b341" },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "github_dark_dimmed")

return M
