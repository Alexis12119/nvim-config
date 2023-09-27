local overrides = require "custom.configs.overrides"

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
    dependencies = {
      {
        "hrsh7th/cmp-cmdline",
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
    opts = overrides.colorizer,
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
      -- formatting
      {
        "stevearc/conform.nvim",
        opts = overrides.conform,
      },
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
        opts = overrides.mason,
      },
      {
        "williamboman/mason-lspconfig.nvim",
      },
      {
        "nvimdev/lspsaga.nvim",
        opts = overrides.lspsaga,
      },
      {
        "folke/neodev.nvim",
        opts = overrides.neodev,
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
    commit = "0a54dcb76b02f3a4e2da370c7a3f6f2b7b43ef01",
    cmd = {
      "NvimTreeOpen",
      "NvimTreeToggle",
      "NvimTreeFocus",
      "NvimTreeFindFile",
      "NvimTreeFindFileToggle",
    },
    opts = overrides.nvimtree,
  },

  -- Icons
  {
    "nvim-tree/nvim-web-devicons",
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
  -- Syntax Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "b7f2dd5dfbd24a1239844e15637b637b990df164",
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
    opts = overrides.treesitter,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },

  -- {
  --   "Exafunction/codeium.vim",
  --   event = "VeryLazy",
  --   config = function()
  --     -- Change '<C-g>' here to any keycode you like.
  --     vim.keymap.set("i", "<C-g>", function()
  --       return vim.fn["codeium#Accept"]()
  --     end, { expr = true })
  --     vim.keymap.set("i", "<c-;>", function()
  --       return vim.fn["codeium#CycleCompletions"](1)
  --     end, { expr = true })
  --     vim.keymap.set("i", "<c-,>", function()
  --       return vim.fn["codeium#CycleCompletions"](-1)
  --     end, { expr = true })
  --     vim.keymap.set("i", "<c-x>", function()
  --       return vim.fn["codeium#Clear"]()
  --     end, { expr = true })

  --     vim.g.codeium_filetypes = {
  --       ["TelescopePrompt"] = false,
  --     }
  --   end,
  -- },

  -- Schemas
  { "b0o/schemastore.nvim" },

  -- Manage Projects
  {
    "ahmedkhalf/project.nvim",
    opts = overrides.projects,
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

  -- Highlight, list and search todo comments in your projects
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    opts = overrides.todo_comments,
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
    opts = overrides.toggleterm,
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
      local messages = require "custom.configs.messages"
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
    opts = overrides.dressing,
  },

  -- Search motions
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = overrides.flash,
  },

  -- Fuzzy Finder
  {
    "nvim-telescope/telescope.nvim",
    init = function()
      require("core.utils").load_mappings "Telescope"
    end,
    opts = overrides.telescope,
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
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
          require "custom.configs.dap.cpptools"
          require "custom.configs.dap.java-debug"
          require "custom.configs.dap.node-debug2"
          require "custom.configs.dap.debugpy"
          require "custom.configs.dap.go-debug-adapter"
          require "custom.configs.dap.js-debug"
        end,
      },
    },
    opts = overrides.dap_ui,
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

  -- {
  --   "folke/noice.nvim",
  --   lazy = false,
  --   opts = overrides.noice,
  --   dependencies = {
  --     { "MunifTanjim/nui.nvim" },
  --     { "rcarriga/nvim-notify" },
  --   },
  -- },
}

return plugins
