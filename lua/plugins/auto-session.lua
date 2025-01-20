---@type NvPluginSpec
-- NOTE: Sessions
return {
  "rmagatti/auto-session",
  cond = false,
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
    auto_save_enabled = true, -- Enables/disables auto saving
    auto_restore_enabled = true, --Enables/disables auto restoring
    auto_session_enabled = true, -- Enables/disables the plugin's auto save and restore features
    auto_session_use_git_branch = true, -- Use the git branch to differentiate the session name
    auto_session_suppress_dirs = {
      "/",
      "~/",
      "~/Downloads",
    },
    bypass_session_save_file_types = {
      "NvimTree",
      "nvdash",
    },
    session_lens = {
      -- If load_on_setup is false, make sure you use `:SessionSearch` to open the picker as it will initialize everything first
      load_on_setup = true,
      theme_conf = {
        border = true,
      },
      previewer = true,
    },
  },
}
