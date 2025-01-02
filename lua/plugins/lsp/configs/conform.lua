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
  event = "VeryLazy",
  opts = {
    format_after_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      -- Disable autoformat for files in a certain path
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      if bufname:match "/node_modules/" then
        return
      end
      return { timeout_ms = 500, lsp_format = "fallback" }
    end,
    formatters_by_ft = formatters_by_ft,
  },
}
