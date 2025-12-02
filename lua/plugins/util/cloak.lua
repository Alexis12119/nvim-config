---@type LazySpec
-- NOTE: Hide .env credentials
return {
  "laytan/cloak.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "<leader>ue", "<cmd>CloakToggle<cr>", desc = "Show/Hide Env" },
  },
}
