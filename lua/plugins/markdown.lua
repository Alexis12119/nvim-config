---@type NvPluginSpec
-- NOTE: Better Markdown
return {
  "MeanderingProgrammer/markdown.nvim",
  ft = "markdown",
  main = "render-markdown",
  opts = {},
  name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
}
