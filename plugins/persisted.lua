-- Sessions
return {
  "olimorris/persisted.nvim",
  cmd = {
    "SessionSave",
    "SessionStart",
    "SessionToggle",
    "SessionLoad",
    "SessionLoadLast",
    "SessionLoadFromFile",
    "SessionLoadDelete",
  },
  init = function()
    require("core.utils").load_mappings "Sessions"
  end,
  opts = {
    save_dir = vim.fn.expand(vim.fn.stdpath "data" .. "/sessions/"), -- directory where session files are saved
    silent = false, -- silent nvim message when sourcing session file
    use_git_branch = true, -- create session files based on the branch of the git enabled repository
    autosave = true, -- automatically save session files when exiting Neovim
    autoload = false, -- automatically load the session for the cwd on Neovim startup
  },
}
