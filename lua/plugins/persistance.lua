---@type NvPluginSpec
-- NOTE: Sessions
return {
  "folke/persistence.nvim",
  enabled = false,
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  init = function()
    -- load the session for the current directory
    vim.keymap.set("n", "<leader>Sl", function()
      require("persistence").load()
    end, { desc = "Persistence | Load", silent = true })

    -- select a session to load
    vim.keymap.set("n", "<leader>Ss", function()
      require("persistence").select()
    end, { desc = "Persistence | Select", silent = true })

    -- load the last session
    vim.keymap.set("n", "<leader>SL", function()
      require("persistence").load { last = true }
    end, { desc = "Persistence | Load Last", silent = true })

    -- stop Persistence => session won't be saved on exit
    vim.keymap.set("n", "<leader>Ss", function()
      require("persistence").stop()
    end, { desc = "Persistence | Stop", silent = true })
  end,
  opts = {
    need = 0,
  },
}
