---@type NvPluginSpec
-- NOTE: Sessions
return {
  "rmagatti/auto-session",
  lazy = false,
  dependencies = {
    "nvim-telescope/telescope.nvim", -- Only needed if you want to use sesssion lens
  },
  init = function()
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

    vim.keymap.set("n", "<leader>st", "<cmd>SessionToggleAutoSave<cr>", { desc = "Session | Toggle", silent = true })
    vim.keymap.set("n", "<leader>sS", "<cmd>SessionSearch<cr>", { desc = "Session | Search", silent = true })
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
  opts = {
    auto_save = true, -- Enables/disables auto saving
    auto_restore = true, --Enables/disables auto restoring
    auto_create = true, -- Enables/disables auto creating new session files. Can be a function that returns true if a new session file should be allowed
    git_use_branch_name = true, --Include git branch name in session name
    suppressed_dirs = {
      "/",
      "~/",
      "~/Downloads",
    },
    bypass_save_filetypes = {
      "NvimTree",
      "nvdash",
    },
  },
}
