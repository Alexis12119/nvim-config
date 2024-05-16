local formatters = {
  lua = { "stylua" },
  python = {
    "ruff_fix",
    "ruff_format",
    -- "isort",
  },
  cpp = { "clang_format" },
  c = { "clang_format" },
  go = { "gofumpt" },
  cs = { "csharpier" },
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
  formatters[filetype] = { "prettier" }
end

return {
  format_after_save = {
    async = true,
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    quiet = true,
    lsp_fallback = true,
  },
  formatters_by_ft = formatters,
}
