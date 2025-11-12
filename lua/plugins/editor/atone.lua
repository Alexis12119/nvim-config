---@type LazySpec
-- NOTE: Modern Undotree
return {
  "XXiaoA/atone.nvim",
  cmd = "Atone",
  opts = {
    layout = {
      ---@type "left"|"right"
      direction = "right",
    },
  }, -- your configuration here
  init = function()
    vim.keymap.set("n", "<leader>bu", ":Atone toggle<CR>", { desc = "Undo Tree" })
  end,
}
