local custom_formatters = {
  csharpier = {
    command = "dotnet-csharpier",
    args = "--write-stdout",
    stdin = true,
  },
}

local formatters = {
  lua = { "stylua" },
  python = { "autopep8" },
  cpp = { "clang_format" },
  c = { "clang_format" },
  go = { "gofumpt" },
  cs = { "csharpier" },
}

local prettier_ft = {
  "angular",
  "css",
  "flow",
  "graphql",
  "html",
  "json",
  "jsx",
  "javaScript",
  "less",
  "markdown",
  "scss",
  "typescript",
  "vue",
  "yaml",
}

for _, filetype in pairs(prettier_ft) do
  formatters[filetype] = { "prettier" }
end

return {
  formatters = custom_formatters,
  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   async = true,
  --   quiet = true,
  --   lsp_fallback = true,
  -- },
  formatters_by_ft = formatters,
}
