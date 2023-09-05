local overrides = require "custom.configs.overrides"

local plugins = {
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp_ui = require("core.utils").load_config().ui.cmp
      local cmp_style = cmp_ui.style
      local cmp = require "cmp"
      local function border(hl_name)
        return {
          { "╭", hl_name },
          { "─", hl_name },
          { "╮", hl_name },
          { "│", hl_name },
          { "╯", hl_name },
          { "─", hl_name },
          { "╰", hl_name },
          { "│", hl_name },
        }
      end

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "cmdline" },
        },
        window = {
          completion = {
            side_padding = (cmp_style ~= "atom" and cmp_style ~= "atom_colored") and 1 or 0,
            winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel",
            scrollbar = false,
          },
          documentation = {
            border = border "CmpDocBorder",
            winhighlight = "Normal:CmpDoc",
          },
        },
      })
    end,
    dependencies = {
      "hrsh7th/cmp-cmdline",
    },
  },

  {
    "NvChad/nvim-colorizer.lua",
    opts = overrides.colorizer,
  },

  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },

  {
    "NvChad/nvim-colorizer.lua",
    lazy = true,
  },

  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      {
        "williamboman/mason.nvim",
        opts = overrides.mason,
      },
      {
        "williamboman/mason-lspconfig.nvim",
      },

      {
        "nvimdev/lspsaga.nvim",
        opts = overrides.lspsaga,
      },
    },
    config = function()
      require "custom.configs.lspconfig"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = {
      "NvimTreeOpen",
      "NvimTreeToggle",
      "NvimTreeFocus",
      "NvimTreeFindFile",
      "NvimTreeFindFileToggle",
    },
    opts = overrides.nvimtree,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    commit = "0a54dcb76b02f3a4e2da370c7a3f6f2b7b43ef01",
    opts = overrides.nvimtree,
  },

  { "b0o/schemastore.nvim", lazy = true },

  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
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

      require("telescope").load_extension "projects"
    end,
  },

  {
    "moll/vim-bbye",
    cmd = { "Bdelete", "Bwipeout" },
  },

  {
    "folke/todo-comments.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = overrides.todo_comments,
  },

  {
    "NvChad/nvterm",
    enabled = false,
  },

  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    cmd = "ToggleTerm",
    opts = overrides.toggleterm,
  },

  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
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

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      input = {
        enabled = true,
        default_prompt = "➤ ",
        win_options = {
          winblend = 0,
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
    },
  },

  {
    "folke/flash.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = overrides.flash,
  },

  {
    "folke/which-key.nvim",
    config = function()
      require "custom.configs.which-key"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = overrides.telescope_pickers,
    },
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
  },

  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },

  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    dependencies = {
      {
        "mfussenegger/nvim-dap",
        config = function()
          require "custom.configs.dap"
        end,
      },
    },
    opts = {
      layouts = {
        {
          elements = {
            -- Elements can be strings or table with id and size keys.
            { id = "scopes", size = 0.25 },
            "breakpoints",
            "stacks",
            "watches",
          },
          size = 40, -- 40 columns
          position = "left",
        },
        {
          elements = {
            "repl",
            "console",
          },
          size = 0.25, -- 25% of total lines
          position = "bottom",
        },
      },
    },
  },

  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
  },

  {
    "sindrets/diffview.nvim",
    event = { "BufReadPost", "BufNewFile" },
  },
}

return plugins
