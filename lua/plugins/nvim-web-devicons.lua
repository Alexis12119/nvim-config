-- NOTE: Icons
return {
  "nvim-tree/nvim-web-devicons",
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "devicons")
    require("nvim-web-devicons").setup(opts)
    --   local icons = require "nvim-web-devicons"

    --   icons.set_icon {
    --     deb = { icon = "", name = "Deb", color = "#A1B7EE" },
    --   }
  end,
}
