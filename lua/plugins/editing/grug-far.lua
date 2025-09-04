---@type NvPluginSpec
-- NOTE: Find And Replace
return {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
  init = function()
    vim.keymap.set("n", "<leader>fR", "<cmd>GrugFar<cr>", { desc = "GrugFar | Find And Replace", silent = true })
  end,
  opts = {},
}
