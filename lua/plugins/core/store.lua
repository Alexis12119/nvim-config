---@type NvPluginSpec
-- NOTE: Plugins Store
return {
  "alex-popov-tech/store.nvim",
  dependencies = { "OXY2DEV/markview.nvim" },
  opts = {},
  cmd = "Store",
  init = function()
    vim.keymap.set("n", "<leader>pS", ":Store<CR>", { desc = "Store", silent = true })
  end,
}
