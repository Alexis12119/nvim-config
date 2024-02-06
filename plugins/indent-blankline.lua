-- Show Indentlines
return {
  "lukas-reineke/indent-blankline.nvim",
  event = "User FilePost",
  opts = {
    show_current_context = true,
    show_current_context_start = false,
  },
}
