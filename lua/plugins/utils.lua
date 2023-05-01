return {
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
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
      dependencies = {},
      config = function()
        require("notify").setup {
          level = 2,
          minimum_width = 50,
          render = "compact",
          stages = "fade",
          timeout = 1000,
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
          },
        },
        select = {
          enabled = true,
          backend = { "telescope", "builtin" },
          builtin = {
            win_options = {
              winblend = 10,
            },
          },
        },
      }
    end,
  },
}
