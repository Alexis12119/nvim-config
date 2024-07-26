-- NOTE: Show Indentlines
return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = false,
  event = "User FilePost",
  config = function()
    dofile(vim.g.base46_cache .. "blankline")
    require("ibl").setup {
      scope = {
        show_start = false,
      },
    }
  end,
}
