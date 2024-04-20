-- NOTE: Sessions
return {
  "olimorris/persisted.nvim",
  -- enabled = false,
  enabled = true,
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
