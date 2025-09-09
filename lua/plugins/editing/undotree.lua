---@type NvPluginSpec
-- NOTE: Undo History
return {
  "mbbill/undotree",
  init = function()
    vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Toggle Undo Tree" })
  end,
  cmd = "UndotreeToggle",
}
