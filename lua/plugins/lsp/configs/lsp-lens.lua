---@type NvPluginSpec
-- NOTE: Displaying References and Definition
return {
  "VidocqH/lsp-lens.nvim",
  event = "LspAttach",
  keys = {
    {
      "<leader>ll",
      "<cmd>LspLensToggle<cr>",
      desc = "LspLens | Toggle Code Lens",
      silent = true,
    },
  },
  opts = {
    enable = true,
  },
}
