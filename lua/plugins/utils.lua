return {
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
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
    dependencies = {
      "rcarriga/nvim-notify",
      enabled = false,
      event = { "BufReadPost", "BufNewFile" },
      dependencies = {},
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
    config = function()
      require("dressing").setup {
        input = {
          enabled = true,
          default_prompt = "➤ ",
          win_options = {
            winblend = 10,
            winhighlight = "Normal:Normal,NormalNC:Normal",
          },
        },
        select = {
          enabled = true,
          backend = { "telescope", "builtin" },
          builtin = {
            win_options = {
              winblend = 10,
              winhighlight = "Normal:Normal,NormalNC:Normal",
            },
          },
        },
      }
    end,
  },
}
