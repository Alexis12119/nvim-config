-- Lua
return {
  "olimorris/persisted.nvim",
  event = "BufReadPre", -- Ensure the plugin loads only when a buffer has been loaded
  enabled = false,
  opts = {
    -- Your config goes here ...
    use_git_branch = true,
    autoload = true,
  },
  init = function()
    vim.keymap.set("n", "<leader>ss", "<cmd>SessionSave<cr>", { desc = "Session | Save", silent = true })
    vim.keymap.set("n", "<leader>sr", "<cmd>SessionLoad<cr>", { desc = "Session | Restore", silent = true })
    vim.keymap.set("n", "<leader>sd", "<cmd>SessionDelete<cr>", { desc = "Session | Delete", silent = true })
    vim.keymap.set("n", "<leader>sS", "<cmd>SessionSelect<cr>", { desc = "Session | Search", silent = true })
    vim.keymap.set("n", "<leader>st", "<cmd>SessionToggle", { desc = "Session | Toggle", silent = true })

    -- The plugin comes with a number of commands:
    --
    --     :SessionToggle - Determines whether to load, start or stop a session
    --     :SessionStart - Start recording a session. Useful if autostart = false
    --     :SessionStop - Stop recording a session
    --     :SessionSave - Save the current session
    --     :SessionSelect - Load a session from the list (useful if you don't wish to use the Telescope extension)
    --     :SessionLoad - Load the session for the current directory and current branch (if git_use_branch = true)
    --     :SessionLoadLast - Load the most recent session
    --     :SessionLoadFromFile - Load a session from a given path
    --     :SessionDelete - Delete the current session
  end,
}
