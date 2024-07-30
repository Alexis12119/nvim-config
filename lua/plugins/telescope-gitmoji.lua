---@type NvPluginSpec
return {
  "olacin/telescope-gitmoji.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  cmd = "Telescope gitmoji",
  init = function()
    vim.keymap.set("n", "<leader>gm", "<cmd>Telescope gitmoji<cr>", { desc = "Telescope | Gitmoji", silent = true })
  end,
  config = function()
    require("telescope").load_extension "gitmoji"
  end,
}
