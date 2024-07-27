-- NOTE: For zen mode
return {
  "folke/zen-mode.nvim",
  init = function()
    vim.keymap.set("n", "<leader>oz", "<cmd>ZenMode<cr>", { desc = "ZenMode | Toggle ZenMode", silent = true })
  end,
  cmd = {
    "ZenMode",
  },
  opts = {
    window = {
      width = 0.7,
    },
    plugins = {
      options = {
        laststatus = 0,
      },
      gitsigns = {
        enabled = true,
      },
      tmux = {
        enabled = true,
      },
    },
  },
}
