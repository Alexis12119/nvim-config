---@type LazySpec
-- NOTE: Tabline
return {
  "akinsho/bufferline.nvim",
  enabled = vim.g.colorscheme ~= "nvchad",
  dependencies = {
    { "tiagovla/scope.nvim", config = true },
  },
}
