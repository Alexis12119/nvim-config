---@type NvPluginSpec
-- NOTE: Hide .env credentials

return {
  "laytan/cloak.nvim",
  event = "VeryLazy",
  init = function()
    vim.keymap.set("n", "<leader>C", "<cmd>CloakToggle<cr>", { desc = "Toggle Cloak" })
  end,
  opts = {},
}
