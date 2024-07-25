--NOTE: Smooth scrolling neovim plugin written in lua
return {
  "karb94/neoscroll.nvim",
  event = "User FilePost",
  opts = {
    hide_cursor = false,
  },
  config = true,
}
