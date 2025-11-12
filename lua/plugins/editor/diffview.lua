---@type LazySpec
-- NOTE: Show Git Diff

return {
  "sindrets/diffview.nvim",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
  },
  init = function()
    vim.keymap.set("n", "<leader>gd", function()
      if next(require("diffview.lib").views) == nil then
        vim.cmd("DiffviewOpen")
      else
        vim.cmd("DiffviewClose")
      end
    end, { desc = "Diffview | Toggle Diffview", silent = true })

    vim.keymap.set(
      "n",
      "<leader>gD",
      "<cmd>DiffviewFileHistory<cr>",
      { desc = "Diffview | File History", silent = true }
    )
  end,
}
