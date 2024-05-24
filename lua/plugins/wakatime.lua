return {
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
    enabled = vim.fn.executable "wakatime" and vim.fn.filereadable(vim.fn.getenv "HOME" .. "/.wakatime.cfg"),
  },
}
