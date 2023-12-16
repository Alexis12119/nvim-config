---@type NvPluginSpec[]
local plugins = {
  -- For Flutter Development
  {
    "akinsho/flutter-tools.nvim",
    ft = "dart",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
  },

  -- Show Indentlines
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },

  -- Keymaps Popup
  {
    "folke/which-key.nvim",
    opts = {
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "", -- symbol prepended to a group
      },
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "whichkey")
      require("which-key").setup(opts)
      require("which-key").register {
        {
          ["<leader>"] = {
            d = { name = "󰃤 Debugger" },
            r = { name = " Runner" },
            s = { name = "󰔚 Sessions" },
            f = { name = " Find" },
            g = { name = "󰊢 Git" },
            l = { name = " LSP" },
            n = { name = " Neovim" },
            o = { name = " Options" },
            p = { name = " Plugins" },
            t = { name = " Terminal" },
            T = { name = "󰙨 Tests" },
          },
        },
      }
    end,
  },

  -- Peek At Lines
  {
    "nacro90/numb.nvim",
    event = "CmdlineEnter",
    config = true,
  },

  -- Completion Engine
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
      opts.mapping = vim.tbl_extend("force", {}, opts.mapping, {
        -- You can add here new mappings.
      })

      opts.completion["completeopt"] = "menu,menuone,noselect" -- disable autoselect
      require("cmp").setup(opts)
    end,
    dependencies = {
      {
        "saecki/crates.nvim",
        tag = "v0.4.0",
        opts = {},
      },
      -- Commandline completions
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
    config = function()
      require "custom.configs.lspconfig"
    end,
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
      -- For Typescript
      {
        "pmizio/typescript-tools.nvim",
        opts = {
          settings = {
            tsserver_file_preferences = {
              includeInlayParameterNameHints = "all",
              includeCompletionsForModuleExports = true,
              quotePreference = "auto",
            },
          },
        },
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
      -- Package Installer
      {
        "williamboman/mason.nvim",
        init = function()
          require("core.utils").load_mappings "Mason"
          require("core.utils").load_mappings "LSP"
        end,
        cmd = {
          "Mason",
          "MasonInstall",
          "MasonInstallAll",
          "MasonUpdate",
          "MasonUninstall",
          "MasonUninstallAll",
          "MasonLog",
        },
        opts = require "custom.configs.mason",
        dependencies = "williamboman/mason-lspconfig.nvim",
      },
      -- Improve Other LSP Functionalities
      {
        "nvimdev/lspsaga.nvim",
        init = function()
          require("core.utils").load_mappings "Lspsaga"
        end,
        opts = require "custom.configs.lspsaga",
      },
      -- For Plugin Development
      {
        "folke/neodev.nvim",
        opts = require "custom.configs.neodev",
      },
    },
  },

  -- Sessions
  {
    "olimorris/persisted.nvim",
    init = function()
      require("core.utils").load_mappings "Sessions"
    end,
    opts = {
      save_dir = vim.fn.expand(vim.fn.stdpath "data" .. "/sessions/"), -- directory where session files are saved
      silent = false, -- silent nvim message when sourcing session file
      use_git_branch = true, -- create session files based on the branch of the git enabled repository
      autosave = false, -- automatically save session files when exiting Neovim
      should_autosave = nil, -- function to determine if a session should be autosaved
      autoload = false, -- automatically load the session for the cwd on Neovim startup
      on_autoload_no_session = nil, -- function to run when `autoload = true` but there is no session to load
      follow_cwd = true, -- change session file name to match current working directory if it changes
      allowed_dirs = nil, -- table of dirs that the plugin will auto-save and auto-load from
      ignored_dirs = nil, -- table of dirs that are ignored when auto-saving and auto-loading
      telescope = { -- options for the telescope extension
        reset_prompt_after_deletion = true, -- whether to reset prompt after session deleted
      },
    },
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
        left = "<C-h>",
        down = "<C-j>",
        up = "<C-k>",
        right = "<C-l>",
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
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99
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
      require("nvim-treesitter.configs").setup(opts)
    end,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "windwp/nvim-ts-autotag",
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
    cmd = { "TodoTrouble", "TodoLocList", "TodoQuickFix", "TodoTelescope" },
    opts = require "custom.configs.todo-comments",
  },

  -- NvChad Built-in Terminal
  {
    "NvChad/nvterm",
    enabled = false,
  },

  {
    "nvim-neotest/neotest",
    init = function()
      require("core.utils").load_mappings "Neotest"
    end,
    dependencies = {
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-go",
      -- "marilari88/neotest-vitest",
      -- "nvim-neotest/neotest-jest",
      -- "nvim-neotest/neotest-rust",
      -- "nvim-neotest/neotest-dotnet",
      -- "nvim-neotest/neotest-java",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require "custom.configs.neotest"
    end,
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
    event = "CmdlineEnter",
    opts = require "custom.configs.flash",
  },

  -- Fuzzy Finder
  {
    "nvim-telescope/telescope.nvim",
    init = function()
      require("core.utils").load_mappings "Telescope"
    end,
    opts = function()
      require "custom.configs.telescope"
    end,
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

  -- Pretty Diagnostics and Lists
  {
    "folke/trouble.nvim",
    init = function()
      require("core.utils").load_mappings "Trouble"
    end,
    cmd = { "TroubleToggle", "Trouble" },
    opts = require "custom.configs.trouble",
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
          vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

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
          require "custom.configs.dap.settings.netcoredbg"
          require "custom.configs.dap.settings.godot"
          require "custom.configs.dap.settings.bash-debug-adapter"
          require "custom.configs.dap.settings.php-debug-adapter"
          require "custom.configs.dap.settings.dart-debug-adapter"
          require "custom.configs.dap.settings.chrome-debug-adapter"
          require "custom.configs.dap.settings.firefox-debug-adapter"
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
    opts = require "custom.configs.noice",
    dependencies = { { "MunifTanjim/nui.nvim" }, { "rcarriga/nvim-notify" } },
  },

  -- Code Runner
  {
    "Zeioth/compiler.nvim",
    init = function()
      require("core.utils").load_mappings "Compiler"
    end,
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = {
      {
        "stevearc/overseer.nvim",
        commit = "400e762648b70397d0d315e5acaf0ff3597f2d8b",
        opts = {
          task_list = {
            direction = "bottom",
            min_height = 10,
            max_height = 15,
            default_detail = 1,
          },
        },
      },
    },
    opts = {},
  },
}

return plugins
