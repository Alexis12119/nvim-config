local C = require "user.highlights.colors"
local hl = vim.api.nvim_set_hl

-- Miscellaneous
hl(0, "TermCursor", { fg = C.cursor_fg, bg = C.cursor_bg })
hl(0, "FocusedSymbol", { fg = C.blue, bg = C.none })
hl(0, "IncSearch", { fg = "black", bg = C.blue })
hl(0, "WinSeparator", { fg = C.blue })
hl(0, "FloatBorder", { fg = C.blue })

-- IndentBlankline
hl(0, "IndentBlanklineContextChar", { fg = C.blue })

-- Alpha
hl(0, "Keyword", { fg = C.purple })
hl(0, "Type", { fg = C.yellow })
hl(0, "Label", { fg = C.blue })

-- Git
hl(0, "GitSignsChange", { fg = C.blue })
hl(0, "GitSignsAdd", { fg = C.green })
hl(0, "GitSignsDelete", { fg = C.red })

-- LSP
hl(0, "LspSagaRenameBorder", { fg = C.blue })
hl(0, "LspSagaDefPreviewBorder", { fg = C.blue })

hl(0, "DiagnosticSignHint", { fg = C.yellow })
hl(0, "DiagnosticSignInfo", { fg = C.blue })

hl(0, "CmpItemKindFolder", { fg = C.green })
hl(0, "CmpItemKindFile", { fg = C.green })

hl(0, "CmpItemKindFunction", { fg = C.violet })
hl(0, "CmpItemKindMethod", { fg = C.violet })
hl(0, "CmpItemKindStruct", { fg = C.violet })

hl(0, "CmpItemKindConstructor", { fg = C.yellow })
hl(0, "CmpItemKindReference", { fg = C.yellow })
hl(0, "CmpItemKindConstant", { fg = C.yellow })
hl(0, "CmpItemKindProperty", { fg = C.yellow })
hl(0, "CmpItemKindClass", { fg = C.yellow })
hl(0, "CmpItemKindField", { fg = C.yellow })
hl(0, "CmpItemKindEvent", { fg = C.yellow })

hl(0, "CmpItemKindTypeParameter", { fg = C.blue })
hl(0, "CmpItemKindEnumMember", { fg = C.blue })
hl(0, "CmpItemKindInterface", { fg = C.blue })
hl(0, "CmpItemKindOperator", { fg = C.blue })
hl(0, "CmpItemKindVariable", { fg = C.blue })
hl(0, "CmpItemKindSnippet", { fg = C.blue })
hl(0, "CmpItemKindKeyword", { fg = C.blue })
hl(0, "CmpItemKindModule", { fg = C.blue })
hl(0, "CmpItemKindValue", { fg = C.blue })
hl(0, "CmpItemKindText", { fg = C.blue })
hl(0, "CmpItemKindUnit", { fg = C.blue })
hl(0, "CmpItemKindEnum", { fg = C.blue })
