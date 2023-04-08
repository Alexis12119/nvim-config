return {
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },

  {
    "moll/vim-bbye",
    enabled = false,
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
    enabled = false,
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
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      {
        "stevearc/dressing.nvim",
      },
    },
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
}
