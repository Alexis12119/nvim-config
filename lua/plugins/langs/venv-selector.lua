---@type NvPluginSpec
-- NOTE: For switching between Python venv
return {
  "linux-cultist/venv-selector.nvim",
  branch = "regexp",
  cmd = { "VenvSelect", "VenvSelectCached" },
  init = function()
    vim.keymap.set("n", "<leader>vs", "<cmd>VenvSelect<cr>", { desc = "Venv Selector | Select Python venv" })
  end,
  opts = {},
  config = function(_, opts)
    require("venv-selector").setup(opts)
  end,
}
