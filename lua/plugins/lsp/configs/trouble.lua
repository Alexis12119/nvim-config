---@type NvPluginSpec
-- NOTE: For managing error and warning messages
return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  keys = {
    {
      "<leader>lb",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Trouble | Buffer Diagnostics",
      silent = true,
    },
    {
      "<leader>lw",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Trouble | Workspace Diagnostics",
      silent = true,
    },
  },
  opts = {
    focus = true, -- Focus the window when opened
  },
}
