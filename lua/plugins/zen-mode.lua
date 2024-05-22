return {
  "folke/zen-mode.nvim",
  init = function()
    vim.keymap.set("n", "<leader>oz", "<cmd>ZenMode<cr>", { desc = "ZenMode | Toggle", silent = true })
  end,
  cmd = { "ZenMode" },
  opts = {
    window = {
      width = 0.7,
    },
  },
}
