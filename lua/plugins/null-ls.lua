return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local null_ls = require "null-ls"

    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = null_ls.builtins.formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    -- local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup {
      debug = false,
      sources = {
        formatting.prettier.with {
          extra_filetypes = { "toml", "solidity" },
          extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
        },
        formatting.gofumpt,
        formatting.autopep8,
        formatting.stylua,
        formatting.clang_format.with {
          filetypes = { "cpp", "c" },
        },
      },
    }
  end,
}
