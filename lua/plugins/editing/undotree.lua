---@type NvPluginSpec
-- NOTE: Undo History
return {
  "mbbill/undotree",
  init = function()
    vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")
  end,
  cmd = "UndotreeToggle",
}
