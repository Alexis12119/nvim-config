require("lint").linters_by_ft = {
  python = { "ruff" },
  markdown = { "markdownlint" },
  latex = { "vale" },
  cpp = { "cpplint" },
  javascript = { "eslint" },
  typescript = { "eslint" },
}

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
