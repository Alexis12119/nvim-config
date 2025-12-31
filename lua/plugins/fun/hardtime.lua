---@type LazySpec
-- NOTE: Vim Motions Guide
return {
  "m4xshen/hardtime.nvim",
  event = "VeryLazy",
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    enabled = false,
  },
  keys = {
    {
      "<leader>uH",
      function()
        vim.cmd("Hardtime toggle")
      end,
      desc = "Toggle Hardtime",
      silent = true,
    },
  },
}
