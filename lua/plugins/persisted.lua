---@type NvPluginSpec
-- NOTE: Sessions
return {
  "olimorris/persisted.nvim",
  enabled = true,
  lazy = true,
  init = function()
    vim.keymap.set("n", "<leader>Ss", "<cmd>SessionSave<cr>", { desc = "Persisted | Save", silent = true })
    vim.keymap.set("n", "<leader>So", "<cmd>SessionStop<cr>", { desc = "Persisted | Stop", silent = true })
    vim.keymap.set("n", "<leader>Sl", "<cmd>SessionLoad<cr>", { desc = "Persisted | Load", silent = true })
    vim.keymap.set("n", "<leader>SL", "<cmd>SessionLoadLast<cr>", { desc = "Persisted | Load Last", silent = true })
    vim.keymap.set("n", "<leader>Sd", "<cmd>SessionDelete<cr>", { desc = "Persisted | Delete", silent = true })
    vim.keymap.set("n", "<leader>St", "<cmd>SessionToggle<cr>", { desc = "Persisted | Toggle", silent = true })
  end,
  cmd = {
    "SessionSave",
    "SessionStart",
    "SessionToggle",
    "SessionLoad",
    "SessionLoadLast",
    "SessionLoadFromFile",
    "SessionLoadDelete",
  },
  opts = {
    save_dir = vim.fn.expand(vim.fn.stdpath "data" .. "/sessions/"), -- directory where session files are saved
    silent = false, -- silent nvim message when sourcing session file
    use_git_branch = true, -- create session files based on the branch of the git enabled repository
    autosave = false, -- automatically save session files when exiting Neovim
    autoload = false, -- automatically load the session for the cwd on Neovim startup
    should_autosave = function()
      local fts = { "NvimTree", "nvdash" }
      local current_ft = vim.bo.filetype
      for _, ft in pairs(fts) do
        if current_ft == ft then
          return false
        end
      end
      return true
    end,
  },
}
