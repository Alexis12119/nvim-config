local formatters_by_ft = {
  lua = { "stylua" },
  python = { "autopep8" },
  cpp = { "clang_format" },
  c = { "clang_format" },
  go = { "gofumpt" },
  cs = { "csharpier" },
  yaml = { "yamlfmt" },
  css = { "prettier" },
  flow = { "prettier" },
  graphql = { "prettier" },
  html = { "prettier" },
  json = { "prettier" },
  javascriptreact = { "prettier" },
  javascript = { "prettier" },
  less = { "prettier" },
  markdown = { "prettier" },
  scss = { "prettier" },
  typescript = { "prettier" },
  typescriptreact = { "prettier" },
  vue = { "prettier" },
}

---@type NvPluginSpec
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
    formatters_by_ft = formatters_by_ft,
  },
}
