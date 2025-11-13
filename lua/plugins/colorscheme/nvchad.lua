---@type LazySpec
-- NOTE: NvChad Plugins
return {
  {
    "nvchad/ui",
    config = function()
      require("nvchad")
    end,
  },

  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  "nvchad/volt", -- optional, needed for theme switcher
  -- or just use Telescope themes

  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    opts = function()
      LazyVim.on_load("telescope.nvim", function()
        if vim.g.colorscheme == "nvchad" then
          require("telescope").load_extension("themes")
        end
      end)
    end,
  },
}
