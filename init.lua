local name = "everblush"

require "core"
require "plugin-loader"

-- Check for theme configuration
-- Theme configs are can be found on lua/plugins/theme
pcall(require, "plugins.theme." .. name)

-- Set the theme
vim.cmd.colorscheme(name)
