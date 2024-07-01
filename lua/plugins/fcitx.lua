return {
  {
    "alohaia/fcitx.nvim",
    enabled = false and vim.fn.has "win32" == 0,
    event = "User FilePost",
    config = function()
      require "fcitx" {}
    end,
  },
}
