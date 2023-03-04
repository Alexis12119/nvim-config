return {
  "is0n/jaq-nvim",
  cmd = { "Jaq", "Jaq terminal", "Jaq float", "Jaq bang", "Jaq quickfix", "Jaq internal" },
  keys = "<F5>",
  config = function()
    local jaq = require "jaq-nvim"

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
          -- cpp = "g++ -std=c++17 -Wall -DAL -O2 % -o $fileBase && $fileBase<input.txt",
          -- Debugging
          -- cpp = "g++ -g % -o  $fileBase && $fileBase",
          -- Normal
          cpp = "g++ % -o  $fileBase && $fileBase",
          c = "gcc % -o $fileBase && $fileBase",
          go = "go run %",
          ruby = "ruby %",
          perl = "perl %",
          cs = "dotnet run",
          julia = "julia %",
          php = "php %",
          -- java = "javac % && java %",
          java = "java %",
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
          win_hl = "Normal",

          -- Floating Window Transparency (see ':h winblend')
          winblend = 0,
        },
      },
    }

    keymap("n", "<F5>", "<cmd>Jaq<cr>", { silent = true })
  end,
}
