return {
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },

  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },

  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        -- Manual mode doesn't automatically change your root directory, so you have
        -- the option to manually do so using `:ProjectRoot` command.
        manual_mode = false,

        -- Methods of detecting the root directory. **"lsp"** uses the native neovim
        -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
        -- order matters: if one is not detected, the other is used as fallback. You
        -- can also delete or rearangne the detection methods.
        detection_methods = { "pattern", "lsp" },

        -- All the patterns used to detect root dir, when **"pattern"** is in
        -- detection_methods
        patterns = { ".git", ".vscode", ".svn", "Makefile", "package.json" },

        -- Table of lsp clients to ignore by name
        -- eg: { "efm", ... }
        ignore_lsp = {},

        -- Don't calculate root dir on specific directories
        -- Ex: { "~/.cargo/*", ... }
        exclude_dirs = {},

        -- Show hidden files in telescope
        show_hidden = false,

        -- When set to false, you will get a message when project.nvim changes your
        -- directory.
        silent_chdir = true,

        -- What scope to change the directory, valid options are
        -- * global (default)
        -- * tab
        -- * win
        scope_chdir = "global",

        -- Path where project.nvim will store the project history for use in
        -- telescope
        datapath = vim.fn.stdpath "data",
      }
    end,
  },

  {
    "moll/vim-bbye",
    cmd = { "Bdelete", "Bwipeout" },
  },

  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
  },

  {
    "stevearc/dressing.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "rcarriga/nvim-notify",
      enabled = false,
      config = function()
        require("notify").setup {
          level = 2,
          minimum_width = 50,
          render = "default",
          stages = "fade",
          timeout = 2000,
          top_down = true,
        }

        vim.notify = require "notify"
      end,
    },
    config = function()
      require("dressing").setup {
        input = {
          enabled = true,
          default_prompt = "➤ ",
          win_options = {
            winblend = 0,
            winhighlight = "FloatBorder:Pmenu",
          },
        },
        select = {
          enabled = true,
          backend = { "telescope", "builtin" },
          builtin = {
            win_options = {
              winblend = 0,
            },
          },
        },
      }
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function()
      local icons = require "nvim-web-devicons"

      icons.set_icon {
        deb = { icon = "", name = "Deb", color = "#A1B7EE" },
        lock = { icon = "", name = "Lock", color = "#C4C720" },
        mp3 = { icon = "", name = "Mp3", color = "#D39EDE" },
        mp4 = { icon = "", name = "Mp4", color = "#9EA3DE" },
        out = { icon = "", name = "Out", color = "#ABB2BF" },
        ["robots.txt"] = { icon = "ﮧ", name = "Robots", "#ABB2BF" },
        [""] = { icon = "", name = "default", "#ABB2Bf" },
        norg = { icon = "", name = "default", "#ABB2Bf" },
        ttf = { icon = "", name = "TrueTypeFont", "#ABB2Bf" },
        rpm = { icon = "", name = "Rpm", "#FCA2Aa" },
        woff = { icon = "", name = "WebOpenFontFormat", color = "#ABB2Bf" },
        woff2 = { icon = "", name = "WebOpenFontFormat2", color = "#ABB2Bf" },
        xz = { icon = "", name = "Xz", color = "#519ABa" },
        zip = { icon = "", name = "Zip", color = "#F9D71c" },
        snippets = { icon = "", name = "Snippets", color = "#51AFEf" },
        ahk = { icon = "", name = "AutoHotkey", color = "#51AFEf" },
      }
    end,
  },
}
