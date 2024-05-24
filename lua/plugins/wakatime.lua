return {
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
    enabled = vim.fn.executable "wakatime" and vim.fn.filereadable "~/.wakatime.cfg",
  },
}
