---@type NvPluginSpec[]
local plugins = {
  -- Show Indentlines
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },

  -- Peek Lines
  {
    "nacro90/numb.nvim",
    event = "VeryLazy",
    config = true,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = function()
      local cmp = require "cmp"
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "cmdline" },
        },
      })
    end,
    config = function(_, opts)
      table.insert(opts.sources, 2, { name = "codeium" })
      require("cmp").setup(opts)
    end,
    dependencies = {
      {
        "saecki/crates.nvim",
        tag = "v0.4.0",
        opts = {},
      },
      {
        "hrsh7th/cmp-cmdline",
      },
      -- AI Autocomplete
      {
        "Exafunction/codeium.nvim",
        opts = {},
      },
      {
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
      },
    },
  },

  -- Preview colors
  {
    "NvChad/nvim-colorizer.lua",
    opts = require "custom.configs.colorizer",
  },

  -- Utilities
  {
    "nvim-lua/plenary.nvim",
  },

  -- Native LSP
  {
    "neovim/nvim-lspconfig",
    init = function()
      require("core.utils").load_mappings "LSP"
    end,
    event = "VeryLazy",
    dependencies = {
      -- Formatting
      {
        "stevearc/conform.nvim",
        opts = require "custom.configs.conform",
      },
      -- Linting
      {
        "mfussenegger/nvim-lint",
        enabled = false,
        config = function()
          require "custom.configs.nvim-lint"
        end,
      },
      -- Start/Stop LSP when focus is lost/gained
      -- {
      --   "hinell/lsp-timeout.nvim",
      --   config = function()
      --     vim.g["lsp-timeout-config"] = {
      --       stopTimeout = 0,
      --       startTimeout = 1,
      --       silent = true, -- true to suppress notifications
      --     }
      --   end,
      -- },
      -- Installer
      {
        "williamboman/mason.nvim",
        cmd = {
          "Mason",
          "MasonInstall",
          "MasonUpdate",
          "MasonUninstall",
          "MasonUninstallAll",
          "MasonLog",
        },
        opts = require "custom.configs.mason",
      },
      {
        "williamboman/mason-lspconfig.nvim",
      },
      -- Improve Other LSP Functionalities
      {
        "nvimdev/lspsaga.nvim",
        opts = require "custom.configs.lspsaga",
      },
      -- For Plugin Development
      {
        "folke/neodev.nvim",
        opts = require "custom.configs.neodev",
      },
    },
    config = function()
      dofile(vim.g.base46_cache .. "lsp")
      require "nvchad.lsp"
      require "custom.configs.lspconfig"
    end,
  },

  -- Commenter
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup {
        -- ignores empty lines
        ignore = "^$",
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
  },

  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    init = function()
      require("core.utils").load_mappings "NvimTree"
    end,
    cmd = {
      "NvimTreeOpen",
      "NvimTreeToggle",
      "NvimTreeFocus",
      "NvimTreeFindFile",
      "NvimTreeFindFileToggle",
    },
    opts = require "custom.configs.nvim-tree",
  },

  -- Icons
  {
    "nvim-tree/nvim-web-devicons",
    -- config = function()
    --   local icons = require "nvim-web-devicons"

    --   icons.set_icon {
    --     deb = { icon = "", name = "Deb", color = "#A1B7EE" },
    --   }
    -- end,
  },

  -- Tmux navigation
  {
    "alexghergh/nvim-tmux-navigation",
    enabled = function()
      if vim.fn.has "win32" == 1 then
        return false
      end
      return true
    end,
    event = "VeryLazy",
    opts = {
      keybindings = {
        left = "<C-H>",
        down = "<C-J>",
        up = "<C-K>",
        right = "<C-L>",
        last_active = "<C-\\>",
        next = "<C-Space>",
      },
    },
  },

  -- Improve Folds
  {
    "kevinhwang91/nvim-ufo",
    event = "VeryLazy",
    init = function()
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      vim.o.foldmethod = "indent"
    end,
    opts = {
      provider_selector = function(_, _, _)
        return { "treesitter", "indent" }
      end,
    },
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require "statuscol.builtin"
          require("statuscol").setup {
            relculright = true,
            segments = {
              { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
              { text = { "%s" }, click = "v:lua.ScSa" },
            },
          }
        end,
      },
    },
  },

  -- Syntax Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    cmd = {
      "TSInstall",
      "TSUninstall",
      "TSInstallInfo",
      "TSUpdate",
      "TSBufEnable",
      "TSBufDisable",
      "TSEnable",
      "TSDisable",
      "TSModuleInfo",
      "TSToggle",
      "TSBufToggle",
    },
    opts = require "custom.configs.treesitter",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      require("nvim-treesitter.install").prefer_git = false
      require("nvim-treesitter.configs").setup(opts)
    end,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },

  -- Schemas
  { "b0o/schemastore.nvim" },

  -- Manage Projects
  {
    "ahmedkhalf/project.nvim",
    opts = require "custom.configs.project",
    event = "VeryLazy",
    config = function(_, opts)
      require("project_nvim").setup(opts)
    end,
  },

  -- Buffer Delete
  {
    "moll/vim-bbye",
    cmd = { "Bdelete", "Bwipeout" },
  },

  -- Highlight, List and Search Todo comments in your projects
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    opts = require "custom.configs.todo-comments",
  },

  {
    "NvChad/nvterm",
    enabled = false,
  },

  -- Terminal Integration
  {
    "akinsho/toggleterm.nvim",
    init = function()
      require("core.utils").load_mappings "Toggleterm"
    end,
    cmd = {
      "ToggleTerm",
      "ToggleTermSendCurrentLine",
      "ToggleTermSendVisualLines",
      "ToggleTermSendVisualSelection",
    },
    opts = require "custom.configs.toggleterm",
  },

  -- Notification
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      dofile(vim.g.base46_cache .. "notify")
      require("notify").setup {
        level = 2,
        minimum_width = 50,
        render = "default",
        stages = "fade",
        timeout = 3000,
        top_down = true,
      }

      vim.notify = require "notify"
      local messages = require "custom.core.messages"
      math.randomseed(os.time())
      local randomMessage = messages[math.random(#messages)]
      if vim.g.startup_message then
        vim.notify(randomMessage, vim.log.levels.INFO, { title = "Just For Fun:" })
      end
    end,
  },

  -- Improve UI
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = require "custom.configs.dressing",
  },

  -- Search motions
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = require "custom.configs.flash",
  },

  -- Fuzzy Finder
  {
    "nvim-telescope/telescope.nvim",
    init = function()
      require("core.utils").load_mappings "Telescope"
    end,
    opts = require "custom.configs.telescope",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        enabled = function()
          return vim.fn.executable "make" == 1
        end,
      },
    },
  },

  -- For Java
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },

  -- Git Signs
  {
    "lewis6991/gitsigns.nvim",
    init = function()
      require("core.utils").load_mappings "Git"
      -- load gitsigns only when a git file is opened
      vim.api.nvim_create_autocmd({ "BufRead" }, {
        group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
        callback = function()
          vim.fn.system("git -C " .. '"' .. vim.fn.expand "%:p:h" .. '"' .. " rev-parse")
          if vim.v.shell_error == 0 then
            vim.api.nvim_del_augroup_by_name "GitSignsLazyLoad"
            vim.schedule(function()
              require("lazy").load { plugins = { "gitsigns.nvim" } }
            end)
          end
        end,
      })
    end,
  },

  -- Debugging
  {
    "rcarriga/nvim-dap-ui",
    init = function()
      require("core.utils").load_mappings "Dap"
    end,
    dependencies = {
      {
        "mfussenegger/nvim-dap",
        config = function()
          -- NOTE: Check out this for guide
          -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
          local dap = require "dap"
          vim.fn.sign_define(
            "DapBreakpoint",
            { text = "🛑", texthl = "DiagnosticSignError", linehl = "", numhl = "" }
          )

          local dapui = require "dapui"
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
          end

          -- dap.listeners.before.event_terminated["dapui_config"] = function()
          --   dapui.close()
          -- end

          -- dap.listeners.before.event_exited["dapui_config"] = function()
          --   dapui.close()
          -- end

          -- NOTE: Make sure to install the needed files/exectubles through mason
          require "custom.configs.dap.settings.cpptools"
          require "custom.configs.dap.settings.java-debug"
          require "custom.configs.dap.settings.node-debug2"
          require "custom.configs.dap.settings.debugpy"
          require "custom.configs.dap.settings.go-debug-adapter"
          require "custom.configs.dap.settings.js-debug"
        end,
      },
    },
    opts = require "custom.configs.dap.ui",
  },

  -- Preview Markdown
  {
    "iamcco/markdown-preview.nvim",
    init = function()
      require("core.utils").load_mappings "MarkdownPreview"
    end,
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
  },

  -- Show diffs
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
  },

  -- UI for messages, cmdline, and popup
  {
    "folke/noice.nvim",
    lazy = false,
    enabled = false,
    opts = require "custom.configs.noice",
    dependencies = {
      { "MunifTanjim/nui.nvim" },
      { "rcarriga/nvim-notify" },
    },
  },
}

return plugins
