---@type NvPluginSpec
-- NOTE: Find And Replace Words
return {
  "nvim-pack/nvim-spectre",
  cond = false,
  init = function()
    vim.keymap.set("n", "<leader>fR", "<cmd>Spectre<cr>", { desc = "Spectre | Find And Replace", silent = true })
  end,
  cmd = "Spectre",
  opts = {},
}
