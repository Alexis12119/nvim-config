require "core"
require "plugin-loader"

local name = "nightly"

local theme_ok = pcall(vim.cmd.colorscheme, name)
if not theme_ok then
  vim.notify("The theme isn't installed or you had a typo", vim.log.levels.ERROR)
  vim.cmd.colorscheme("habamax")
else
  require("plugins.theme." .. name)
end
