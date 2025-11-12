---@type LazySpec
-- NOTE: Vim Motions Guide
return {
  "tris203/precognition.nvim",
  enabled = false,
  event = "VeryLazy",
  opts = {
    startVisible = true,
  },
  keys = {
    {
      "<leader>uP",
      function()
        require("precognition").toggle()
      end,
      desc = "Precognition: Toggle",
      silent = true,
    },
  },
}
