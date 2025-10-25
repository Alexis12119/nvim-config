---@type NvPluginSpec
-- NOTE: Icons

return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    local icons = require "nvim-web-devicons"

    icons.set_icon {
      deb = { icon = "", name = "Deb", color = "#A1B7EE" },
      jinja = { icon = "", name = "Jinja", color = "#A1B7EE" },
    }
  end,
}
