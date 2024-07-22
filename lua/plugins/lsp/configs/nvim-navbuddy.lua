return {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
  cmd = { "Navbuddy" },
  init = function()
    vim.keymap.set("n", "<leader>ln", "<cmd>Navbuddy<cr>", { desc = "Navbuddy | Open", silent = true })
  end,
  opts = {
    lsp = {
      auto_attach = true,
    },
  },
}
