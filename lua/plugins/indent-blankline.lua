-- NOTE: Show Indentlines
return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = false,
  event = "User FilePost",
  config = function()
    require("ibl").setup {
      scope = {
        show_start = false,
      },
    }
  end,
}
