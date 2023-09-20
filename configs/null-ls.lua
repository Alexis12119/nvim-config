-- Backup
local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {
  -- webdev stuff
  -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with {
    extra_filetypes = { "toml", "solidity" },
    extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
  },
  -- Lua
  b.formatting.stylua,
  b.formatting.gofumpt,
  b.formatting.autopep8,
  -- cpp
  b.formatting.clang_format.with {
    filetypes = { "c", "cpp" },
  },
}

null_ls.setup {
  debug = true,
  sources = sources,
}
