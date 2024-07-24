-- NOTE:
-- Type ":Lazy load vim-wakatime" to generate ".wakatime.cfg".
-- You only need to do this once.
-- To disable, remove "~./wakatime.cfg".
local plugin = {
  "wakatime/vim-wakatime",
}

if vim.fn.filereadable(vim.fn.getenv "HOME" .. "/.wakatime.cfg") == 1 then
  plugin.event = "User FilePost"
end

return plugin
