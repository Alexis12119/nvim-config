---@type LazySpec
-- NOTE: NvChad Plugins
return {
  {
    "nvchad/ui",
    enabled = false,
    config = function()
      require("nvchad")
    end,
  },

  {
    "nvchad/base46",
    enabled = false,
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  "nvchad/volt", -- optional, needed for theme switcher
  -- or just use Telescope themes
}
