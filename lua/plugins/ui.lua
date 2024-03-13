-- NOTE: UI related plugins
return {
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
  -- Notification
  {
    "rcarriga/nvim-notify",
    -- lazy = false,
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
      local messages = require "core.messages"
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
}
