return {
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
    enabled = (vim.fn.executable "wakatime" or vim.fn.executable "wakatime-cli")
      and vim.fn.filereadable(vim.fn.getenv "HOME" .. "/.wakatime.cfg"),
  },
}
