---@type NvPluginSpec
-- NOTE: Notification
return {
  "rcarriga/nvim-notify",
  -- lazy = false,
  event = "VeryLazy",
  opts = {
    level = 2,
    minimum_width = 50,
    render = "default",
    stages = "fade",
    timeout = 3000,
    top_down = false,
  },
  config = function()
    vim.notify = require "notify"
    local messages = require "core.messages"
    math.randomseed(os.time())
    local randomMessage = messages[math.random(#messages)]
    if vim.g.startup_message then
      vim.notify(randomMessage, vim.log.levels.INFO, { title = "Just For Fun:" })
    end
  end,
}
