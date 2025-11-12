---@type LazySpec
-- NOTE: For switching between Python venv
return {
  "linux-cultist/venv-selector.nvim",
  branch = "regexp",
  cmd = { "VenvSelect", "VenvSelectCached" },
  init = function()
    vim.keymap.set("n", "<leader>cp", "<cmd>VenvSelect<cr>", { desc = "Python Select Venv" })
  end,
  opts = {},
  config = function(_, opts)
    require("venv-selector").setup(opts)
  end,
}
