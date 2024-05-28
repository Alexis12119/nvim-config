-- NOTE: Displaying References and Definition
return {
  "VidocqH/lsp-lens.nvim",
  event = "LspAttach",
  init = function()
    vim.keymap.set("n", "<leader>ll", "<cmd>LspLensToggle<cr>", { desc = "LspLens | Toggle Code Lens", silent = true })
  end,
  opts = {
    enable = true,
  },
}
