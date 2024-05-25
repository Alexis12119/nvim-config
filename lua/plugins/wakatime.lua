return {
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
    enabled = vim.fn.filereadable(vim.fn.getenv "HOME" .. "/.wakatime.cfg"),
  },
}
