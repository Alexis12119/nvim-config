---@type NvPluginSpec
-- NOTE: Sessions
return {
  "rmagatti/auto-session",
  event = "VeryLazy",
  init = function()
    vim.keymap.set("n", "<leader>st", "<cmd>SessionToggleAutoSave<cr>", { desc = "Session | Toggle", silent = true })
    vim.keymap.set("n", "<leader>sS", "<cmd>Telescope session-lens<cr>", { desc = "Session | Search", silent = true })
    vim.keymap.set("n", "<leader>sd", "<cmd>SessionDelete<cr>", { desc = "Session | Delete", silent = true })
    vim.keymap.set("n", "<leader>sr", "<cmd>SessionRestore<cr>", { desc = "Session | Restore", silent = true })
    vim.keymap.set("n", "<leader>ss", "<cmd>SessionSave<cr>", { desc = "Session | Save", silent = true })

    vim.api.nvim_create_autocmd({ "BufEnter" }, {
      pattern = "NvimTree*",
      callback = function()
        local api = require "nvim-tree.api"
        local view = require "nvim-tree.view"
        if not view.is_visible() then
          api.tree.open()
        end
      end,
    })
  end,
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    auto_restore = false,
    suppressed_dirs = {
      "/",
      "~/",
      "~/Downloads",
    },
    bypass_save_filetypes = {
      "NvimTree",
      "nvdash",
    },
    session_lens = {
      picker = "telescope",
      load_on_setup = true,
    },
  },
}
