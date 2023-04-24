local name = "nightly"

-- Fix for no cmp cursorline when using other themes
if name ~= "nightly" then
  vim.api.nvim_set_hl(0, "CmpCursorLine", { link = "CursorLine" })
  vim.api.nvim_set_hl(0, "CmpDocumentationBorder", { link = "FloatBorder" })
  vim.api.nvim_set_hl(0, "CmpCompletionBorder", { link = "FloatBorder" })
end

require "core"
require "plugin-loader"

-- Check for theme configuration
-- Theme configs are can be found on lua/plugins/theme
pcall(require, "plugins.theme." .. name)

-- Set the theme
vim.cmd.colorscheme(name)
