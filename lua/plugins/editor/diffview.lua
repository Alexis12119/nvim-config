---@type LazySpec
-- NOTE: Show Git Diff
return {
  "sindrets/diffview.nvim",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  keys = {
    {
      "<leader>gd",
      function()
        local lib = require("diffview.lib")
        if next(lib.views) == nil then
          vim.cmd("DiffviewOpen")
        else
          vim.cmd("DiffviewClose")
        end
      end,
      desc = "Diffview: Toggle Diffview",
      silent = true,
    },
    {
      "<leader>gD",
      "<cmd>DiffviewFileHistory<cr>",
      desc = "Diffview: File History",
      silent = true,
    },
  },
}
