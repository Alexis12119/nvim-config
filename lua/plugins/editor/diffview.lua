---@type LazySpec
-- NOTE: Show Git Diff
return {
  "sindrets/diffview.nvim",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  opts = {

    view = {
      -- For more info, see |diffview-config-view.x.layout|.
      default = {
        -- Config for changed files, and staged files in diff views.
        layout = "diff2_horizontal",
        disable_diagnostics = false, -- Temporarily disable diagnostics for diff buffers while in the view.
        winbar_info = false, -- See |diffview-config-view.x.winbar_info|
      },
      merge_tool = {
        layout = "diff3_mixed",
        disable_diagnostics = true, -- Temporarily disable diagnostics for diff buffers while in the view.
        winbar_info = true, -- See |diffview-config-view.x.winbar_info
      },
    },
  },
  keys = {
    { "<leader>gd", false },
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
