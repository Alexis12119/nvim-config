return {
  "mbbill/undotree",
  init = function()
    vim.keymap.set("n", "<leader>ou", "<cmd>UndotreeToggle<cr>", { desc = "Undotree | Toggle", silent = true })
  end,
  cmd = { "UndotreeToggle" },
}
