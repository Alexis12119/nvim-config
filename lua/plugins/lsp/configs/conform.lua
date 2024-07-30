local formatters_by_ft = {
  lua = { "stylua" },
  python = {
    "ruff_fix",
    "ruff_format",
  },
  -- cpp = { "clang_format" },
  -- c = { "clang_format" },
  -- go = { "gofumpt" },
  -- cs = { "csharpier" },
  sh = { "shfmt" },
  ["markdown"] = { "prettier", "doctoc" },
  ["markdown.mdx"] = { "prettier", "doctoc" },
}

local prettier_ft = {
  "css",
  "flow",
  "graphql",
  "html",
  "json",
  "javascriptreact",
  "javascript",
  "less",
  "scss",
  "typescript",
  "typescriptreact",
  "vue",
  "yaml",
}

for _, filetype in pairs(prettier_ft) do
  formatters_by_ft[filetype] = { "prettier" }
end

local formatters = {
  ["clang_format"] = {
    append_args = {
      "--fallback-style=Microsoft",
    },
  },
  ["doctoc"] = {
    append_args = {
      "--update-only",
    },
  },
  ["markdown-toc"] = {
    append_args = {
      "--bullets=-",
    },
  },
  ["prettier"] = {
    append_args = {
      "--single-quote",
      -- "--jsx-single-quote", -- NOTE: Don't use this if you want all jsx to be single quote
    },
  },
  ["ruff_fix"] = {
    append_args = {
      "--select=I",
      "--ignore=F401",
    },
  },
}

---@type NvPluginSpec
return {
  -- NOTE: Formatting
  "stevearc/conform.nvim",
  event = "User FilePost",
  opts = {
    format_after_save = {
      async = true,
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      quiet = true,
      lsp_fallback = true,
    },
    formatters_by_ft = formatters_by_ft,
    formatters = formatters,
  },
}
