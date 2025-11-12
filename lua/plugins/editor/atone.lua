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
  },
  keys = {
    {
      "<leader>bu",
      "<cmd>Atone toggle<cr>",
      desc = "Undo Tree",
      silent = true,
    },
  },
}
