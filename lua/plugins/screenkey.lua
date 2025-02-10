---@type NvPluginSpec
-- NOTE: Show Screenkey
return {
  "NStefan002/screenkey.nvim",
  keys = {
    {
      "<leader>ok",
      "<cmd>Screenkey<cr>",
      desc = "Screenkey | Toggle Screenkey",
      silent = true,
    },
  },
  cmd = "Screenkey",
  opts = {},
}
