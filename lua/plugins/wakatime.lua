-- NOTE:
-- Type ":Lazy load vim-wakatime" to generate ".wakatime.cfg".
-- You only need to do this once.
-- To disable, remove "~./wakatime.cfg".
return {
  "wakatime/vim-wakatime",
  event = vim.fn.filereadable(vim.fn.getenv "HOME" .. "/.wakatime.cfg") == 1 and "User FilePost" or nil,
}
