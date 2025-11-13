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
  telescope = { style = "bordered" },
  statusline = {
    enabled = false,
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    order = {
      "mode",
      "file",
      "git",
      "%=",
      "lsp_msg",
      "python_venv",
      "diagnostics",
      "command",
      "clients",
      "cwd",
      "total_lines",
    },
    modules = require("config.statusline").modules,
  },
  tabufline = {
    enabled = false,
    lazyload = true,
    modules = require("config.tabufline").modules,
  },
}

return M
