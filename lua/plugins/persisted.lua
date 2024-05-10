-- NOTE: Sessions
return {
  "olimorris/persisted.nvim",
  enabled = true,
  init = function()
    vim.keymap.set("n", "<leader>so", "<cmd>SessionStop<cr>", { desc = "Persisted | Stop", silent = true })
    vim.keymap.set("n", "<leader>sl", "<cmd>SessionLoad<cr>", { desc = "Persisted | Load", silent = true })
    vim.keymap.set("n", "<leader>sL", "<cmd>SessionLoad<cr>", { desc = "Persisted | Load Last", silent = true })
    vim.keymap.set("n", "<leader>sd", "<cmd>SessionDelete<cr>", { desc = "Persisted | Delete", silent = true })
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
    autosave = true, -- automatically save session files when exiting Neovim
    autoload = false, -- automatically load the session for the cwd on Neovim startup
  },
  init = function()
    -- close nvim-tree before exist while using persisted
    vim.api.nvim_create_autocmd("ExitPre", {
      callback = function()
        require("nvim-tree.view").close_all_tabs()
      end,
      group = vim.api.nvim_create_augroup("Persisted", { clear = true }),
      desc = "Close nvim-tree before exit",
    })
  end,
}
