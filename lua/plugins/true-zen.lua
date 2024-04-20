return {
  {
    "pocco81/true-zen.nvim",
    enabled = false,
    opts = {
      integrations = {
        tmux = false and vim.fn.has "win32" == 0,
        kitty = {
          enabled = false,
          font = "+3",
        },
        twilight = false,
        lualine = false,
      },
    },
  },
}
