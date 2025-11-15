require("config.lazy")
require("config.env")
require("config.commands")
require("config.filetypes")
require("config.utils")

if vim.g.colorscheme == "nvchad" then
  -- load theme
  dofile(vim.g.base46_cache .. "defaults")
  dofile(vim.g.base46_cache .. "statusline")
end
