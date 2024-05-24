return {
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
    enable = vim.fn.executable "wakatime" and vim.fn.filereadable "~/.wakatime.cfg",
  },
}
