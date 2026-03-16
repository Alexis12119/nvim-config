return {
  "lvim-tech/lvim-dependencies",
  commit = "f52ec6923a2274a455be4d17d0154fe588e34097",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("lvim-dependencies").setup({
      -- your configuration here
    })
  end,
}
