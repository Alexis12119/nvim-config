---@type NvPluginSpec
-- NOTE: Better Windsurf

return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  enabled = false,
  opts = {
    filetypes = {
      TelescopePrompt = false,
      ["dap-repl"] = false,
    },
    filter = function(bufnr)
      if vim.endswith(vim.api.nvim_buf_get_name(bufnr), ".env") then
        return false
      end
      return true
    end,
  },
  init = function()
    vim.keymap.set("i", "<A-f>", function()
      require("neocodeium").accept()
    end)
    vim.keymap.set("i", "<A-w>", function()
      require("neocodeium").accept_word()
    end)
    vim.keymap.set("i", "<A-a>", function()
      require("neocodeium").accept_line()
    end)
    vim.keymap.set("i", "<A-e>", function()
      require("neocodeium").cycle_or_complete()
    end)
    vim.keymap.set("i", "<A-r>", function()
      require("neocodeium").cycle_or_complete(-1)
    end)
    vim.keymap.set("i", "<A-c>", function()
      require("neocodeium").clear()
    end)
  end,
  config = function(_, opts)
    local neocodeium = require "neocodeium"
    neocodeium.setup(opts)
  end,
}
