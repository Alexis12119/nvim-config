---@type LazySpec
-- NOTE: Show Keys
return {
  "nvzone/showkeys",
  cmd = "ShowkeysToggle",
  keys = {
    {
      "<leader>uk",
      "<cmd>ShowkeysToggle<cr>",
      desc = "Toggle Showkeys",
      silent = true,
    },
  },
}
