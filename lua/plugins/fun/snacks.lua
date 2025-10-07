---@type NvPluginSpec
-- NOTE: QoL Plugins

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    indent = {
      enabled = true,
      scope = {
        enabled = false,
      },
    },
    input = { enabled = false },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = false },
    scroll = { enabled = true },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    image = { enabled = true },
  },
  init = function()
    vim.keymap.set("n", "<leader>fn", function()
      Snacks.picker.notifications()
    end, { desc = "Snacks | Notification History", silent = true })
    vim.keymap.set("n", "<leader>c", function()
      Snacks.bufdelete()
    end, { desc = "Snacks | Close Buffer", silent = true })
    -- Close window
    vim.keymap.set("n", "<leader>w", function()
      if vim.bo.buftype == "terminal" then
        Snacks.bufdelete()
        vim.cmd "silent! close"
      elseif #vim.api.nvim_list_wins() > 1 then
        vim.cmd "silent! close"
      else
        vim.notify("Can't Close Window", vim.log.levels.WARN, { title = "Close Window" })
      end
    end, { desc = "Snacks | Close window", silent = true })
    vim.keymap.set("n", "<leader>ns", function()
      Snacks.scratch()
    end, { desc = "Snacks | Toggle Scratch", silent = true })

    -- vim.keymap.set("n", "<leader>fs", function()
    --   Snacks.scratch.select()
    -- end, { desc = "Snacks | Select Scratch", silent = true })
  end,
}
