local formatters_by_ft = {
  lua = { "stylua" },
  python = {
    "ruff_fix",
    "ruff_format",
  },
  -- cpp = { "clang_format" },
  -- c = { "clang_format" },
  go = { "gofumpt" },
  cs = { "csharpier" },
  sh = { "shfmt" },
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
  "markdown",
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
  clang_format = { append_args = { "--fallback-style=Microsoft" } },
  ruff_fix = { append_args = { "--select=I", "--ignore=F401" } },
}

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
