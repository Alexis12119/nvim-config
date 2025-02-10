---@type NvPluginSpec
-- NOTE: Find And Replace Words
return {
  "nvim-pack/nvim-spectre",
  enabled = false,
  keys = {
    {
      "<leader>fR",
      "<cmd>Spectre<cr>",
      desc = "Spectre | Find And Replace",
      silent = true,
    },
  },
  cmd = "Spectre",
  opts = {},
}
