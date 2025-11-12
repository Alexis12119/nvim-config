---@type LazySpec
-- NOTE: Vim Motions Guide
return {
  "tris203/precognition.nvim",
  enabled = false,
  event = "VeryLazy",
  init = function()
    vim.keymap.set("n", "<leader>uP", function()
      require("precognition").toggle()
    end, { desc = "Toggle Precognition", silent = true })
  end,
  opts = {
    startVisible = true,
  },
}
