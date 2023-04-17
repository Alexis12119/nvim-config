return {
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },

  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    dependencies = "nvim-lualine/lualine.nvim",
    config = function ()
      vim.g.startuptime_tries = 5
    end
  },

  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
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
