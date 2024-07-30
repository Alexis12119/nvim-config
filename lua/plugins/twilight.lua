---@type NvPluginSpec
-- NOTE: Dim code, well use along with "folke/zen-mode.nvim"
return {
  "folke/twilight.nvim",
  init = function()
    vim.keymap.set("n", "<leader>od", "<cmd>Twilight<cr>", { desc = "Twilight | Toggle Dim", silent = true })
  end,
  cmd = {
    "Twilight",
  },
}
