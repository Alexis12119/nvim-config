-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

local highlights = require("highlights")
M.base46 = {
  theme = "github_dark_dimmed",
  transparency = false,
  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.ui = {
  telescope = { style = "borderless" },
  tabufline = {
    enabled = false,
    lazyload = false,
  },
}

return M
