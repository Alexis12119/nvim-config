---@type LazySpec
-- NOTE: Vim Motions Guide
return {
  "tris203/precognition.nvim",
  event = "VeryLazy",
  opts = {
    startVisible = false,
  },
  keys = {
    {
      "<leader>uP",
      function()
        require("precognition").toggle()
      end,
      desc = "Toggle Precognition",
      silent = true,
    },
  },
}
