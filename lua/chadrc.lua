-- NOTE: NvChad Related Options
---@type ChadrcConfig
-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(
local M = {}

local highlights = require "highlights"
local headers = require "core.statusline.headers"

local function get_header(default)
  if vim.g.random_header then
    local headerNames = {}
    for name, _ in pairs(headers) do
      table.insert(headerNames, name)
    end

    local randomName = headerNames[math.random(#headerNames)]
    local randomHeader = headers[randomName]
    return randomHeader
  else
    local name = (default == nil or default == "") and "nvchad" or default
    return headers[name]
  end
end

M.ui = {
  telescope = { style = "borderless" }, -- borderless / bordered
  cmp = {
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    format_colors = {
      tailwind = true,
    },
  },
  statusline = {
    theme = "minimal", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "round",
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
    modules = require("core.statusline").modules,
  },

  tabufline = {
    enabled = true,
    order = { "treeOffset", "buffers", "tabs", "btns" },
    modules = require("core.tabufline").modules,
  },
}

M.nvdash = {
  load_on_startup = true,
  header = get_header "nvchad",
  buttons = {
    { txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
    { txt = "󰈚  Recent Files", keys = "Spc f r", cmd = "Telescope oldfiles" },
    { txt = "󰈭  Find Word", keys = "Spc f w", cmd = "Telescope live_grep" },
    { txt = "  Find Projects", keys = "Spc f p", cmd = "Telescope projects" },
    { txt = "  Themes", keys = "Spc f t", cmd = "Telescope themes" },
    { txt = "  Mappings", keys = "Spc n c", cmd = "NvCheatsheet" },
    { txt = "─", no_gap = true, rep = true },
    {
      txt = function()
        local stats = require("lazy").stats()
        local milliseconds = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. milliseconds
      end,
      no_gap = true,
    },
    { txt = "─", no_gap = true, rep = true },
  },
}

M.cheatsheet = { theme = "grid" } -- simple/grid

M.mason = {
  cmd = true,
  -- Use names from mason.nvim
  -- For example, if you want to install "tsserver" you should use "typescript-language-server" in the list below
  pkgs = {
    -- Lua
    "lua-language-server",
    "vim-language-server",
    "stylua",

    -- Web Development
    -- "css-lsp",
    -- "html-lsp",
    -- "typescript-language-server",
    -- "deno",
    -- "vue-language-server",
    -- "tailwindcss-language-server",
    -- "emmet_language_server",
    -- "eslint-lsp",

    -- PHP
    -- "intelephense",

    -- C/C++
    -- "clangd",
    -- "clang-format",

    -- CMake
    -- "neocmakelsp",

    -- Java
    -- "jdtls",

    -- Yaml
    -- "yaml-language-server",

    -- Python
    -- "basedpyright",

    -- Go
    -- "gopls",

    -- C#
    -- "omnisharp",
    -- "omnisharp-mono",
  },
}

M.lsp = { signature = false }

M.base46 = {
  theme = "catppuccin",
  transparency = false,
  theme_toggle = { "catppuccin", "one_light" },
  hl_override = highlights.override,
  hl_add = highlights.add,
  integrations = {
    "notify",
    "dap",
    "trouble",
  },
}

-- M.lazy_nvim = require "core.lazy" -- config for lazy.nvim startup options

-- M.plugins = "plugins"

-- check core.mappings for table structure
-- M.mappings = require "mappings"

return M
