local status_ok, jaq = pcall(require, "jaq-nvim")
if not status_ok then
  return
end
local keymap = vim.keymap.set

jaq.setup {
  -- Commands used with 'Jaq'
  cmds = {
    -- Uses external commands such as 'g++' and 'cargo'
    external = {
      typescript = "tsc % && node $fileBase",
      javascript = "node %",
      python = "python $file",
      rust = "rustc % && $fileBase",
      -- Competitive Programming
      -- cpp = "g++ -std=c++17 -Wall -DAL -O2 % -o $fileBase.exe && $fileBase.exe<input.txt",
      -- Normal
      cpp = "g++ -std=c++17 -Wall -DAL -O2 % -o $fileBase.exe && $fileBase.exe",
      c = "gcc -std=c17 % -o $fileBase && $fileBase",
      go = "go run %",
      ruby = "ruby %",
      perl = "perl %",
      cs = "dotnet run",
      julia = "julia %",
      php = "php %",
      java = "javac % && java %",
      r = "Rscript %",
      kotlin = "kotlinc % -include-runtime -d $fileBase.jar && java -jar $fileBase.jar",
      lua = "lua %",
      lisp = "clisp %",
    },

    -- Uses internal commands such as 'source' and 'luafile'
    internal = {
      lua = "luafile %",
      vim = "source %",
    },
  },

  behavior = {
    -- Default type
    default = "terminal",

    -- Start in insert mode
    startinsert = true,

    -- Use `wincmd p` on startup
    wincmd = false,
  },

  -- UI settings
  ui = {
    -- Floating Window / FTerm settings
    float = {
      -- Floating window border (see ':h nvim_open_win')
      border = "rounded",

      -- Num from `0 - 1` for measurements
      height = 0.8,
      width = 0.8,
      x = 0.5,
      y = 0.5,

      -- Highlight group for floating window/border (see ':h winhl')
      border_hl = "FloatBorder",
      float_hl = "Normal",

      -- Floating Window Transparency (see ':h winblend')
      blend = 0,
    },
  },
}
-- Code Run
keymap("n", "<F5>", ":Jaq<CR>", { silent = true })
