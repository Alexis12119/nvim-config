---@type NvPluginSpec
-- NOTE: Show diffs
return {
  "sindrets/diffview.nvim",
  keys = {
    {
      "<leader>gd",
      function()
        if next(require("diffview.lib").views) == nil then
          vim.cmd "DiffviewOpen"
        else
          vim.cmd "DiffviewClose"
        end
      end,
      desc = "Diffview | Toggle Diffview",
      silent = true,
    },
  },
  event = "VeryLazy",
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
  },
}
