-- Credits: https://github.com/projekt0n/github-nvim-theme
local M = {}

M.base_30 = {
  white = "#adbac7",
  black = "#1e2228",
  darker_black = "#191d23",
  black2 = "#24292f",
  one_bg = "#24292f",
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
  green = "#57ab5a",
  vibrant_green = "#6bc46d",
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
  statusline_bg = "#24292f",
  lightbg = "#2b3137",
  pmenu_bg = "#39c5cf",
  folder_bg = "#768390",
}

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
  base0C = "#56d4dd",
  base0D = M.base_30.teal,
  base0E = M.base_30.purple,
  base0F = M.base_30.orange,
}

M.extras = {
  light_blue = "#96d0ff", -- classes/types
  lighter_blue = "#a5d6ff", -- strings
  keyword_purple = "#c8a1ff", -- keywords
  lighter_blue_builtin = "#79b8ff", -- builtin functions
  diff_dark_blue = "#314c72",
  diff_dark_grey = "#2b3240",
  diff_dark_green = "#244032",
  diff_dark_red = "#422b2b",
  diff_dark_blue2 = "#143D79",
}

local C = M.base_30
local E = M.extras

M.polish_hl = {
  defaults = {
    LineNr = { fg = C.grey },
    CursorLineNr = { fg = C.blue, bold = true },
    Search = { fg = C.white, bg = C.one_bg3 },
    IncSearch = { fg = C.black, bg = C.blue },
    CurSearch = { fg = C.black, bg = C.blue },
    Substitute = { fg = C.white, bg = C.one_bg3 },

    -- DiffView syntax highlights (WebStorm-style)
    DiffAdd = { bg = E.diff_dark_green, fg = C.green },
    DiffDelete = { bg = E.diff_dark_red, fg = C.red },
    DiffChange = { bg = E.diff_dark_blue, fg = C.blue },
    DiffText = { bg = E.diff_dark_blue, fg = C.white, bold = true },

    -- Diffview.nvim custom groups
    DiffviewDiffAdd = { bg = E.diff_dark_green },
    DiffviewDiffDelete = { bg = E.diff_dark_red, fg = E.diff_dark_red },
    DiffviewDiffChange = { bg = E.diff_dark_grey },
    DiffviewDiffText = { bg = E.diff_dark_blue, bold = true },

    -- Inline diff markers
    DiffAddAsDelete = { bg = E.diff_dark_red, fg = C.red },
    DiffDeleteText = { bg = E.diff_dark_red, fg = C.red },
    DiffChangeDelete = { bg = E.diff_dark_grey, fg = C.blue },

    GitSignsAdd = { fg = C.green },
    GitSignsChange = { fg = C.blue },
    GitSignsDelete = { fg = C.red },
  },

  treesitter = {
    ["@comment"] = { fg = C.light_grey, italic = true },
    ["@keyword"] = { fg = C.red },
    ["@keyword.function"] = { fg = C.red },
    ["@function"] = { fg = C.blue },
    ["@function.builtin"] = { fg = C.blue },
    ["@string"] = { fg = E.light_blue },
    ["@number"] = { fg = C.yellow },
    ["@boolean"] = { fg = C.yellow },
    ["@type"] = { fg = C.teal },
    ["@constant"] = { fg = C.blue },
    ["@property"] = { fg = C.white },
    ["@variable"] = { fg = C.white },
    ["@variable.builtin"] = { fg = C.orange },
    ["@punctuation.bracket"] = { fg = C.red },

    -- Python-specific Tree-sitter highlights
    ["@keyword.import.python"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.global.python"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.return.python"] = { fg = E.keyword_purple, bold = true },
    ["@keyword.python"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.function.python"] = { fg = E.keyword_purple, italic = true },

    ["@class.python"] = { fg = E.light_blue },
    ["@type.python"] = { fg = E.light_blue },
    ["@type.builtin.python"] = { fg = C.teal },
    ["@constructor.python"] = { fg = C.blue, bold = true },

    ["@function.python"] = { fg = C.blue },
    ["@function.builtin.python"] = { fg = E.lighter_blue, italic = true },
    ["@function.call.python"] = { fg = C.blue },

    ["@variable.parameter.python"] = { fg = C.pink },
    ["@variable.member.python"] = { fg = C.white },
    ["@variable.builtin.python"] = { fg = C.orange, italic = true },
    ["@field.python"] = { fg = C.white },
    ["@property.python"] = { fg = C.white },

    ["@string.python"] = { fg = E.lighter_blue },
    ["@string.doc.python"] = { fg = C.light_grey, italic = true },
    ["@constant.python"] = { fg = C.yellow },
    ["@constant.builtin.python"] = { fg = C.orange },
    ["@number.python"] = { fg = C.yellow },
    ["@boolean.python"] = { fg = C.yellow },

    ["@operator.python"] = { fg = C.purple },
    ["@punctuation.delimiter.python"] = { fg = C.light_grey },
    ["@exception.python"] = { fg = C.red, bold = true },
    ["@conditional.python"] = { fg = C.red },
    ["@repeat.python"] = { fg = C.red },

    -- Java-specific Tree-sitter highlights
    ["@keyword.import.java"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.package.java"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.return.java"] = { fg = E.keyword_purple, bold = true },
    ["@keyword.java"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.modifier.java"] = { fg = E.keyword_purple, italic = true },

    ["@class.java"] = { fg = E.light_blue },
    ["@interface.java"] = { fg = E.light_blue, italic = true },
    ["@type.java"] = { fg = E.light_blue },
    ["@type.builtin.java"] = { fg = C.teal },
    ["@constructor.java"] = { fg = C.blue, bold = true },

    ["@method.call.java"] = { fg = C.blue },
    ["@function.method.java"] = { fg = C.blue },
    ["@function.builtin.java"] = { fg = E.lighter_blue, italic = true },
    ["@function.java"] = { fg = C.blue },

    ["@variable.parameter.java"] = { fg = C.pink },
    ["@variable.member.java"] = { fg = C.white },
    ["@variable.builtin.java"] = { fg = C.orange, italic = true },
    ["@field.java"] = { fg = C.white },
    ["@property.java"] = { fg = C.white },

    ["@string.java"] = { fg = E.lighter_blue },
    ["@constant.java"] = { fg = C.yellow },
    ["@constant.builtin.java"] = { fg = C.orange },
    ["@number.java"] = { fg = C.yellow },
    ["@boolean.java"] = { fg = C.yellow },

    ["@annotation.java"] = { fg = C.purple, italic = true },
    ["@operator.java"] = { fg = C.purple },
    ["@punctuation.delimiter.java"] = { fg = C.light_grey },
    ["@exception.java"] = { fg = C.red, bold = true },
    ["@conditional.java"] = { fg = C.red },
    ["@repeat.java"] = { fg = C.red },

    -- JavaScript
    ["@keyword.import.javascript"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.export.javascript"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.return.javascript"] = { fg = E.keyword_purple, bold = true },
    ["@keyword.javascript"] = { fg = E.keyword_purple, italic = true },
    ["@type.javascript"] = { fg = E.light_blue },
    ["@type.builtin.javascript"] = { fg = C.teal },
    ["@constructor.javascript"] = { fg = C.blue, bold = true },
    ["@function.javascript"] = { fg = C.blue },
    ["@function.call.javascript"] = { fg = C.blue },
    ["@function.builtin.javascript"] = { fg = E.lighter_blue_builtin, italic = true },
    ["@variable.parameter.javascript"] = { fg = C.pink },
    ["@variable.member.javascript"] = { fg = C.white },
    ["@variable.builtin.javascript"] = { fg = C.orange, italic = true },
    ["@string.javascript"] = { fg = E.lighter_blue },
    ["@number.javascript"] = { fg = C.yellow },
    ["@boolean.javascript"] = { fg = C.yellow },
    ["@constant.javascript"] = { fg = C.yellow },
    ["@constant.builtin.javascript"] = { fg = C.orange },
    ["@operator.javascript"] = { fg = C.purple },
    ["@punctuation.delimiter.javascript"] = { fg = C.light_grey },
    ["@conditional.javascript"] = { fg = C.red },
    ["@repeat.javascript"] = { fg = C.red },

    -- TypeScript
    ["@keyword.import.typescript"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.export.typescript"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.return.typescript"] = { fg = E.keyword_purple, bold = true },
    ["@keyword.typescript"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.function.typescript"] = { fg = E.keyword_purple, italic = true },
    ["@type.typescript"] = { fg = E.light_blue },
    ["@type.builtin.typescript"] = { fg = C.teal },
    ["@class.typescript"] = { fg = E.light_blue },
    ["@constructor.typescript"] = { fg = C.blue, bold = true },
    ["@function.typescript"] = { fg = C.blue },
    ["@function.call.typescript"] = { fg = C.blue },
    ["@function.builtin.typescript"] = { fg = E.lighter_blue_builtin, italic = true },
    ["@variable.parameter.typescript"] = { fg = C.pink },
    ["@variable.member.typescript"] = { fg = C.white },
    ["@variable.builtin.typescript"] = { fg = C.orange, italic = true },
    ["@string.typescript"] = { fg = E.lighter_blue },
    ["@number.typescript"] = { fg = C.yellow },
    ["@boolean.typescript"] = { fg = C.yellow },
    ["@constant.typescript"] = { fg = C.yellow },
    ["@constant.builtin.typescript"] = { fg = C.orange },
    ["@operator.typescript"] = { fg = C.purple },
    ["@punctuation.delimiter.typescript"] = { fg = C.light_grey },
    ["@conditional.typescript"] = { fg = C.red },
    ["@repeat.typescript"] = { fg = C.red },

    -- JavaScript React (JSX)
    ["@tag.jsx"] = { fg = C.blue },
    ["@tag.attribute.jsx"] = { fg = C.pink },
    ["@tag.delimiter.jsx"] = { fg = C.light_grey },
    ["@property.jsx"] = { fg = C.white },
    ["@string.jsx"] = { fg = E.lighter_blue },
    ["@constant.jsx"] = { fg = C.yellow },
    ["@function.jsx"] = { fg = C.blue },
    ["@keyword.jsx"] = { fg = E.keyword_purple, italic = true },

    -- TypeScript React (TSX)
    ["@keyword.import.tsx"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.export.tsx"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.return.tsx"] = { fg = E.keyword_purple, bold = true },
    ["@keyword.tsx"] = { fg = E.keyword_purple, italic = true },
    ["@function.tsx"] = { fg = C.blue },
    ["@type.tsx"] = { fg = E.light_blue },
    ["@class.tsx"] = { fg = E.light_blue },
    ["@string.tsx"] = { fg = E.lighter_blue },
    ["@variable.tsx"] = { fg = C.white },

    -- HTML
    ["@tag.html"] = { fg = C.blue },
    ["@tag.attribute.html"] = { fg = C.pink },
    ["@tag.delimiter.html"] = { fg = C.light_grey },
    ["@string.html"] = { fg = E.lighter_blue },
    ["@constant.html"] = { fg = C.yellow },

    -- CSS / SCSS
    ["@property.css"] = { fg = C.white },
    ["@property.id.css"] = { fg = E.light_blue },
    ["@property.class.css"] = { fg = E.light_blue },
    ["@string.css"] = { fg = E.lighter_blue },
    ["@number.css"] = { fg = C.yellow },
    ["@type.css"] = { fg = E.light_blue },
    ["@function.css"] = { fg = C.blue },
    ["@keyword.css"] = { fg = E.keyword_purple, italic = true },

    -- JSON / YAML
    ["@property.json"] = { fg = C.white },
    ["@string.json"] = { fg = E.lighter_blue },
    ["@number.json"] = { fg = C.yellow },
    ["@boolean.json"] = { fg = C.yellow },
    ["@field.yaml"] = { fg = C.white },
    ["@string.yaml"] = { fg = E.lighter_blue },
    ["@number.yaml"] = { fg = C.yellow },
    ["@boolean.yaml"] = { fg = C.yellow },

    -- C# / CSharp
    ["@keyword.import.c_sharp"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.namespace.c_sharp"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.return.c_sharp"] = { fg = E.keyword_purple, bold = true },
    ["@keyword.c_sharp"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.modifier.c_sharp"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.operator.c_sharp"] = { fg = C.purple },

    ["@class.c_sharp"] = { fg = E.light_blue },
    ["@interface.c_sharp"] = { fg = E.light_blue, italic = true },
    ["@struct.c_sharp"] = { fg = E.light_blue },
    ["@enum.c_sharp"] = { fg = E.light_blue },
    ["@type.c_sharp"] = { fg = E.light_blue },
    ["@type.builtin.c_sharp"] = { fg = C.teal },
    ["@constructor.c_sharp"] = { fg = C.blue, bold = true },

    ["@method.c_sharp"] = { fg = C.blue },
    ["@method.call.c_sharp"] = { fg = C.blue },
    ["@function.c_sharp"] = { fg = C.blue },
    ["@function.call.c_sharp"] = { fg = C.blue },
    ["@function.builtin.c_sharp"] = { fg = E.lighter_blue_builtin, italic = true },

    ["@variable.parameter.c_sharp"] = { fg = C.pink },
    ["@variable.member.c_sharp"] = { fg = C.white },
    ["@variable.builtin.c_sharp"] = { fg = C.orange, italic = true },
    ["@field.c_sharp"] = { fg = C.white },
    ["@property.c_sharp"] = { fg = C.white },

    ["@string.c_sharp"] = { fg = E.lighter_blue },
    ["@constant.c_sharp"] = { fg = C.yellow },
    ["@constant.builtin.c_sharp"] = { fg = C.orange },
    ["@number.c_sharp"] = { fg = C.yellow },
    ["@boolean.c_sharp"] = { fg = C.yellow },

    ["@operator.c_sharp"] = { fg = C.purple },
    ["@punctuation.delimiter.c_sharp"] = { fg = C.light_grey },
    ["@exception.c_sharp"] = { fg = C.red, bold = true },
    ["@conditional.c_sharp"] = { fg = C.red },
    ["@repeat.c_sharp"] = { fg = C.red },

    -- Go / Golang
    ["@keyword.import.go"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.package.go"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.return.go"] = { fg = E.keyword_purple, bold = true },
    ["@keyword.go"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.function.go"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.operator.go"] = { fg = C.purple },

    ["@type.go"] = { fg = E.light_blue },
    ["@type.builtin.go"] = { fg = C.teal },
    ["@struct.go"] = { fg = E.light_blue },
    ["@interface.go"] = { fg = E.light_blue, italic = true },
    ["@constructor.go"] = { fg = C.blue, bold = true },

    ["@function.go"] = { fg = C.blue },
    ["@function.call.go"] = { fg = C.blue },
    ["@function.builtin.go"] = { fg = E.lighter_blue_builtin, italic = true },
    ["@method.go"] = { fg = C.blue },
    ["@method.call.go"] = { fg = C.blue },

    ["@variable.parameter.go"] = { fg = C.pink },
    ["@variable.member.go"] = { fg = C.white },
    ["@variable.builtin.go"] = { fg = C.orange, italic = true },
    ["@field.go"] = { fg = C.white },
    ["@property.go"] = { fg = C.white },

    ["@string.go"] = { fg = E.lighter_blue },
    ["@constant.go"] = { fg = C.yellow },
    ["@constant.builtin.go"] = { fg = C.orange },
    ["@number.go"] = { fg = C.yellow },
    ["@boolean.go"] = { fg = C.yellow },

    ["@operator.go"] = { fg = C.purple },
    ["@punctuation.delimiter.go"] = { fg = C.light_grey },
    ["@exception.go"] = { fg = C.red, bold = true },
    ["@conditional.go"] = { fg = C.red },
    ["@repeat.go"] = { fg = C.red },

    -- Rust
    ["@keyword.rust"] = { fg = E.keyword_purple, italic = true },
    ["@type.rust"] = { fg = E.light_blue },
    ["@type.builtin.rust"] = { fg = C.teal },
    ["@function.rust"] = { fg = C.blue },
    ["@function.call.rust"] = { fg = C.blue },
    ["@macro.rust"] = { fg = C.purple },
    ["@variable.parameter.rust"] = { fg = C.pink },
    ["@variable.builtin.rust"] = { fg = C.orange, italic = true },
    ["@constant.rust"] = { fg = C.yellow },
    ["@operator.rust"] = { fg = C.purple },
    ["@conditional.rust"] = { fg = C.red },
    ["@repeat.rust"] = { fg = C.red },

    -- Markdown
    ["@markup.heading.1.markdown"] = { fg = C.red, bold = true },
    ["@markup.heading.2.markdown"] = { fg = C.orange, bold = true },
    ["@markup.heading.3.markdown"] = { fg = C.yellow, bold = true },
    ["@markup.heading.4.markdown"] = { fg = C.green, bold = true },
    ["@markup.heading.5.markdown"] = { fg = C.blue, bold = true },
    ["@markup.heading.6.markdown"] = { fg = C.purple, bold = true },
    ["@markup.heading.1.marker.markdown"] = { fg = C.red, bold = true },
    ["@markup.heading.2.marker.markdown"] = { fg = C.orange, bold = true },
    ["@markup.heading.3.marker.markdown"] = { fg = C.yellow, bold = true },
    ["@markup.heading.4.marker.markdown"] = { fg = C.green, bold = true },
    ["@markup.heading.5.marker.markdown"] = { fg = C.blue, bold = true },
    ["@markup.heading.6.marker.markdown"] = { fg = C.purple, bold = true },

    ["@markup.strong.markdown_inline"] = { fg = C.orange, bold = true },
    ["@markup.italic.markdown_inline"] = { fg = C.white, italic = true },
    ["@markup.strikethrough.markdown_inline"] = { fg = C.light_grey, strikethrough = true },

    ["@markup.link.label.markdown_inline"] = { fg = E.light_blue },
    ["@markup.link.url.markdown_inline"] = { fg = C.cyan, underline = true },
    ["@markup.link.markdown_inline"] = { fg = C.cyan, underline = true },

    ["@markup.raw.markdown_inline"] = { fg = C.teal },
    ["@markup.raw.block.markdown"] = { fg = C.teal },

    ["@markup.quote.markdown"] = { fg = C.light_grey, italic = true },
    ["@markup.list.checked.markdown"] = { fg = C.green },
    ["@markup.list.unchecked.markdown"] = { fg = C.red },
    ["@markup.list.markdown"] = { fg = C.yellow },

    ["@punctuation.special.markdown"] = { fg = C.purple },

    -- PHP
    ["@keyword.php"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.import.php"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.return.php"] = { fg = E.keyword_purple, bold = true },
    ["@keyword.function.php"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.modifier.php"] = { fg = E.keyword_purple, italic = true },

    ["@type.php"] = { fg = E.light_blue },
    ["@type.builtin.php"] = { fg = C.teal },
    ["@class.php"] = { fg = E.light_blue },
    ["@interface.php"] = { fg = E.light_blue, italic = true },
    ["@constructor.php"] = { fg = C.blue, bold = true },

    ["@function.php"] = { fg = C.blue },
    ["@function.call.php"] = { fg = C.blue },
    ["@function.builtin.php"] = { fg = E.lighter_blue_builtin, italic = true },
    ["@method.php"] = { fg = C.blue },
    ["@method.call.php"] = { fg = C.blue },

    ["@variable.php"] = { fg = C.white },
    ["@variable.parameter.php"] = { fg = C.pink },
    ["@variable.member.php"] = { fg = C.white },
    ["@variable.builtin.php"] = { fg = C.orange, italic = true },
    ["@property.php"] = { fg = C.white },
    ["@field.php"] = { fg = C.white },

    ["@string.php"] = { fg = E.lighter_blue },
    ["@constant.php"] = { fg = C.yellow },
    ["@constant.builtin.php"] = { fg = C.orange },
    ["@number.php"] = { fg = C.yellow },
    ["@boolean.php"] = { fg = C.yellow },

    ["@operator.php"] = { fg = C.purple },
    ["@punctuation.delimiter.php"] = { fg = C.light_grey },
    ["@exception.php"] = { fg = C.red, bold = true },
    ["@conditional.php"] = { fg = C.red },
    ["@repeat.php"] = { fg = C.red },

    ["@tag.php"] = { fg = C.red }, -- PHP tags (<?php, ?>)
    ["@namespace.php"] = { fg = E.light_blue },

    -- Dart
    ["@keyword.dart"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.function.dart"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.import.dart"] = { fg = E.keyword_purple, italic = true },
    ["@keyword.return.dart"] = { fg = E.keyword_purple, bold = true },
    ["@keyword.modifier.dart"] = { fg = E.keyword_purple, italic = true },

    ["@type.dart"] = { fg = E.light_blue },
    ["@type.builtin.dart"] = { fg = C.teal },
    ["@class.dart"] = { fg = E.light_blue },
    ["@interface.dart"] = { fg = E.light_blue, italic = true },
    ["@constructor.dart"] = { fg = C.blue, bold = true },

    ["@function.dart"] = { fg = C.blue },
    ["@function.call.dart"] = { fg = C.blue },
    ["@function.builtin.dart"] = { fg = E.lighter_blue_builtin, italic = true },
    ["@method.dart"] = { fg = C.blue },
    ["@method.call.dart"] = { fg = C.blue },

    ["@variable.dart"] = { fg = C.white },
    ["@variable.parameter.dart"] = { fg = C.pink },
    ["@variable.member.dart"] = { fg = C.white },
    ["@variable.builtin.dart"] = { fg = C.orange, italic = true },
    ["@field.dart"] = { fg = C.white },
    ["@property.dart"] = { fg = C.white },

    ["@string.dart"] = { fg = E.lighter_blue },
    ["@string.doc.dart"] = { fg = C.light_grey, italic = true },
    ["@constant.dart"] = { fg = C.yellow },
    ["@constant.builtin.dart"] = { fg = C.orange },
    ["@number.dart"] = { fg = C.yellow },
    ["@boolean.dart"] = { fg = C.yellow },

    ["@operator.dart"] = { fg = C.purple },
    ["@punctuation.delimiter.dart"] = { fg = C.light_grey },
    ["@exception.dart"] = { fg = C.red, bold = true },
    ["@conditional.dart"] = { fg = C.red },
    ["@repeat.dart"] = { fg = C.red },

    ["@annotation.dart"] = { fg = C.purple, italic = true },
    ["@attribute.dart"] = { fg = C.purple },

    -- LSP Semantic Highlights
    ["@lsp.type.class"] = { fg = E.light_blue },
    ["@lsp.type.comment"] = { fg = C.light_grey, italic = true },
    ["@lsp.type.decorator"] = { fg = C.purple, italic = true },
    ["@lsp.type.enum"] = { fg = E.light_blue },
    ["@lsp.type.enumMember"] = { fg = C.yellow },
    ["@lsp.type.event"] = { fg = C.blue },
    ["@lsp.type.function"] = { fg = C.blue },
    ["@lsp.type.interface"] = { fg = E.light_blue, italic = true },
    ["@lsp.type.keyword"] = { fg = C.red },
    ["@lsp.type.macro"] = { fg = C.purple },
    ["@lsp.type.method"] = { fg = C.blue },
    ["@lsp.type.modifier"] = { fg = C.red, italic = true },
    ["@lsp.type.namespace"] = { fg = E.light_blue },
    ["@lsp.type.number"] = { fg = C.yellow },
    ["@lsp.type.operator"] = { fg = C.purple },
    ["@lsp.type.parameter"] = { fg = C.pink },
    ["@lsp.type.property"] = { fg = C.white },
    ["@lsp.type.regexp"] = { fg = E.lighter_blue },
    ["@lsp.type.string"] = { fg = E.lighter_blue },
    ["@lsp.type.struct"] = { fg = E.light_blue },
    ["@lsp.type.type"] = { fg = C.teal },
    ["@lsp.type.typeParameter"] = { fg = C.pink },
    ["@lsp.type.variable"] = { fg = C.white },

    ["@lsp.mod.abstract"] = { bold = true },
    ["@lsp.mod.async"] = { italic = true },
    ["@lsp.mod.declaration"] = { bold = true },
    ["@lsp.mod.defaultLibrary"] = { fg = C.blue },
    ["@lsp.mod.definition"] = { underline = false },
    ["@lsp.mod.deprecated"] = { strikethrough = true },
    ["@lsp.mod.documentation"] = { fg = C.light_grey, italic = true },
    ["@lsp.mod.modification"] = { underline = true },
    ["@lsp.mod.readonly"] = { fg = C.yellow },
    ["@lsp.mod.static"] = { bold = true },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "github_dark_dimmed")

return M
