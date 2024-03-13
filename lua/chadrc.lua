-- NOTE: NvChad Related Options
---@type ChadrcConfig
local M = {}

local headers = require "core.headers"

local function get_venv(variable)
  local venv = os.getenv(variable)
  if venv ~= nil and string.find(venv, "/") then
    local orig_venv = venv
    for w in orig_venv:gmatch "([^/]+)" do
      venv = w
    end
    venv = string.format("%s", venv)
  end
  return venv
end

local function get_header()
  if vim.g.random_header then
    local headerNames = {}
    for name, _ in pairs(headers) do
      table.insert(headerNames, name)
    end

    local randomName = headerNames[math.random(#headerNames)]
    local randomHeader = headers[randomName]
    return randomHeader
  else
    return headers["nvchad"]
  end
end

local highlights = require "highlights"

M.ui = {
  theme = "mountain",
  theme_toggle = { "mountain", "one_light" },
  lsp_semantic_tokens = false, -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens
  hl_override = highlights.override,
  hl_add = highlights.add,
  extended_integrations = {}, -- these aren't compiled by default, ex: "alpha", "notify"
  telescope = { style = "borderless" }, -- borderless / bordered
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
  },
  statusline = {
    theme = "minimal", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "round",
    order = { "mode", "file", "git", "%=", "python_venv", "diagnostics", "command", "clients", "cwd", "cursor" },
    modules = {
      python_venv = function()
        if vim.bo.filetype ~= "python" then
          return " "
        end

        local venv = get_venv "CONDA_DEFAULT_ENV" or get_venv "VIRTUAL_ENV" or " "
        if venv == " " then
          return " "
        else
          return "  " .. venv
        end
      end,
      command = function()
        local noice_ok, noice = pcall(require, "noice.api")
        if noice_ok and noice.status.command.has() then
          return " %#St_gitIcons#" .. noice.status.command.get() .. " "
        else
          return " "
        end
      end,
      clients = function()
        local clients = {}
        local buf = vim.api.nvim_get_current_buf()

        -- Iterate through all the clients for the current buffer
        for _, client in pairs(vim.lsp.get_active_clients { bufnr = buf }) do
          -- Add the client name to the `clients` table
          table.insert(clients, client.name)
        end

        local conform_ok, conform = pcall(require, "conform")
        if conform_ok then
          local formatters = conform.list_formatters(0)
          for _, formatter in pairs(formatters) do
            table.insert(clients, formatter.name)
          end
        end

        if #clients == 0 then
          return ""
        else
          return (vim.o.columns > 100 and (" %#St_gitIcons#" .. table.concat(clients, ", ") .. " ")) or "  LSP "
        end
      end,
    },
  },

  -- lazyload it when there are 1+ tabs
  tabufline = {
    show_numbers = false,
    enabled = true,
    lazyload = true,
    order = { "treeOffset", "blank", "tabs", "btns" },
    modules = {
      blank = function()
        return "%#Normal#" .. "%=" -- empty space
      end,
    },
    -- modules[3] = (function()
    --   return " %#TblineFill#%@v:lua.ClickUpdate@  %#TblineFill#%@v:lua.ClickGit@  %#TblineFill#%@v:lua.RunCode@  %#TblineFill#%@v:lua.ClickSplit@  "
    -- end)()
  },

  nvdash = {
    load_on_startup = true,
    header = get_header(),
    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f r", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Find Projects", "Spc f p", "Telescope projects" },
      { "󰔚  Find Sessions", "Spc f s", "Telescope persisted" },
      { "  Themes", "Spc f t", "Telescope themes" },
      { "  Mappings", "Spc n c", "NvCheatsheet" },
    },
  },

  cheatsheet = { theme = "grid" }, -- simple/grid
}

M.lazy_nvim = require "core.lazy" -- config for lazy.nvim startup options

M.plugins = "plugins"

-- check core.mappings for table structure
M.mappings = require "mappings"

return M
