---@type NvPluginSpec
-- NOTE: Show diffs
return {
  "sindrets/diffview.nvim",
  init = function()
    vim.keymap.set("n", "<leader>gd", function()
      if next(require("diffview.lib").views) == nil then
        vim.cmd "DiffviewOpen"
      else
        vim.cmd "DiffviewClose"
      end
    end, { desc = "Diffview | Toggle Diffview", silent = true })
  end,
  event = "VeryLazy",
  cmd = { "DiffviewOpen", "DiffviewClose" },
}
