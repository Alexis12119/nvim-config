local overrides = require "custom.configs.overrides"

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
      "hrsh7th/cmp-cmdline",
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

  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
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

  -- Syntax Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },

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
    cmd = "ToggleTerm",
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
      local memeMessages = {
        "When your code works perfectly on the first try: 'Is this real life, or is it just fantasy?'",
        "Why did the developer bring a ladder to the coding competition? To take their code to the next level!",
        "When your code is running slowly: 'It's not a bug; it's a feature that takes its time.'",
        "Why did the programmer go to therapy? Because their code had too many 'issues'!",
        "Why was the JavaScript developer sad? Because they didn't 'console' their feelings!",
        "Why did the developer go broke? Because he used up all his buffer!",
        "Neovim: Where we use fewer keystrokes than you have friends.",
        "Why did the developer get locked out of their own codebase? They forgot the 'key'!",
        "Why do programmers always have an umbrella on their desk? Because you never know when it will start 'raining bugs.'",
        "Welcome to Neovim, where plugins multiply faster than rabbits!",
        "Why was the Neovim user always calm? Because they knew they could always :q!",
        "Why did the programmer go broke? Because they used up all their cache!",
        "How many programmers does it take to change a lightbulb? None, that's a hardware problem!",
        "When you're debugging and can't find the issue: 'I swear, it was working yesterday!'",
        "Why don't programmers trust stairs? Because they're always up to 'something'!",
        "When you fix a bug without even trying: 'I guess I'm just that good.'",
        "Why was the computer cold? It left its Windows open!",
        "Why do Java developers wear glasses? Because they don't C#!",
        "Why don't programmers like nature? It has too many bugs!",
        "Why did the programmer quit their job? They didn't get arrays!",
        "When your code finally compiles without errors: 'I am the master of my fate, I am the captain of my soul.'",
        "When you write a one-liner that solves a complex problem: 'I am a genius, yes, I am.'",
        "When your colleague asks for help with Git: 'You underestimate my power!'",
        "When you find the perfect Stack Overflow answer: 'This is the way.'",
        "When you refactor your code and it breaks everything: 'I've made a huge mistake.'",
        "When your code works in the development environment but fails in production: 'I don't know what I expected.'",
        "When you spend hours debugging a missing semicolon: 'The force is not strong with this one.'",
        "When you accidentally close your editor with unsaved changes: 'Goodbye, cruel world.'",
        "When you discover a bug on a Friday afternoon: 'Looks like we're working late again.'",
        "When you realize your code from last year: 'Who wrote this junk? Oh, wait...'",
        "When the client wants changes after the project is 'complete': 'Change is the only constant.'",
        "When you write a comment and six months later can't understand it: 'I speak my own language.'",
        "When you join a new project with zero documentation: 'Here be dragons.'",
        "When you Google an error message and find a 10-year-old forum post: 'Am I in a time machine?'",
        "When you add a 'TODO' comment and hope someone else will deal with it: 'Not my problem.'",
      }

      math.randomseed(os.time())
      local randomMessage = memeMessages[math.random(#memeMessages)]
      if vim.g.startup_messages then
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
    opts = {
      pickers = overrides.telescope_pickers,
      extensions_list = { "themes", "terms", "fzf", "projects" },
    },
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
  },

  -- For java
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },

  -- Debugging
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      {
        "mfussenegger/nvim-dap",
        config = function()
          require "custom.configs.dap"
        end,
      },
    },
    opts = overrides.dap_ui,
  },

  -- Preview Markdown
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
  },

  -- Show diffs
  {
    "sindrets/diffview.nvim",
    event = { "BufReadPost", "BufNewFile" },
  },
}

return plugins
