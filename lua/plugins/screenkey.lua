---@type NvPluginSpec
-- NOTE: Show Screenkey
return {
  "NStefan002/screenkey.nvim",
  init = function()
    vim.keymap.set("n", "<leader>ok", "<cmd>Screenkey<cr>", { desc = "Screenkey | Toggle Screenkey", silent = true })
  end,
  cmd = "Screenkey",
  opts = {},
}
