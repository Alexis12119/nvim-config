return {
  {
    "zbirenbaum/copilot.lua",
    build = "<cmd>Copilot auth<CR>",
    cmd = "Copilot",
    opts = {
      panel = { enabled = false },
      suggestion = { enabled = false },
    },
    config = function(_, opts)
      require("copilot").setup(opts)
      vim.cmd "Copilot disable"
    end,
  },
}
