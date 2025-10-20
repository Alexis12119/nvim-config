---@type NvPluginSpec
-- NOTE: Neogit
return {
  "NeogitOrg/neogit",
  enabled = false,
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
  },
  init = function()
    vim.keymap.set("n", "<leader>gn", "<cmd>Neogit<cr>", { desc = "Neogit | Open Neogit", silent = true })
  end,
}
