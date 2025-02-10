---@type NvPluginSpec
-- NOTE: Find And Replace
return {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
  keys = {
    {
      "<leader>fR",
      "<cmd>GrugFar<cr>",
      desc = "GrugFar | Find And Replace",
      silent = true,
    },
  },
  opts = {},
}
