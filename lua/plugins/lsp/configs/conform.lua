local formatters = {
  lua = { "stylua" },
  python = { "autopep8" },
  cpp = { "clang_format" },
  c = { "clang_format" },
  go = { "gofumpt" },
  cs = { "csharpier" },
  yaml = { "yamlfmt" },
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
}

for _, filetype in pairs(prettier_ft) do
  formatters[filetype] = { "prettier" }
end

return {
  -- NOTE: Formatting
  "stevearc/conform.nvim",
  event = "User FilePost",
  opts = {
    -- format_after_save = {
    --   async = true,
    -- },
    -- format_on_save = {
    --   -- These options will be passed to conform.format()
    --   quiet = true,
    --   lsp_fallback = true,
    -- },
    formatters_by_ft = formatters,
  },
}
