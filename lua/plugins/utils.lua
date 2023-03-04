return {
  {
    "folke/neodev.nvim",
    lazy = true,
  },

  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },

  {
    "nvim-lua/plenary.nvim",
    lazy = true,
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
    "dstein64/vim-startuptime",
    init = function()
      vim.g.startuptime_tries = 5
    end,
    cmd = "StartupTime",
    dependencies = {
      "nvim-lualine/lualine.nvim", -- Just to fix stuck issue on vim-startuptime
    },
  },

  {
    "rcarriga/nvim-notify",
    enabled = false,
    config = function()
      require("notify").setup {
        level = 2,
        minimum_width = 50,
        render = "default",
        stages = "fade",
        timeout = 3000,
        top_down = true,
      }

      vim.notify = require "notify"
    end,
  },

  {
    "stevearc/dressing.nvim",
    enabled = false,
  },
}
