---@type ChadrcConfig
local M = {}

local highlights = require "custom.highlights"

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },
  lsp_semantic_tokens = false, -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens
  hl_override = highlights.override,
  hl_add = highlights.add,
  extended_integrations = {
    "notify",
  }, -- these aren't compiled by default, ex: "alpha", "notify"
  telescope = { style = "borderless" }, -- borderless / bordered
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
  },
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    overriden_modules = function(modules)
      modules[8] = (function()
        local clients = {}

        -- Iterate through all the clients for the current buffer
        for _, client in pairs(vim.lsp.buf_get_clients()) do
          -- Skip the client if its name is "null-ls"
          if client.name ~= "null-ls" then
            -- Add the client name to the `clients` table
            table.insert(clients, client.name)
          end
        end

        -- -- Call the `list_registered_formatters` function and store the result and error (if any)
        -- local formatters_ok, supported_formatters, _ = pcall(list_registered_formatters, vim.bo.filetype)
        --
        -- -- Call the `list_registered_linters` function and store the result and error (if any)
        -- local linters_ok, supported_linters = pcall(list_registered_linters, vim.bo.filetype)
        --
        -- -- If the call to `list_registered_formatters` was successful and there are more than 0 formatters registered
        -- if formatters_ok and #supported_formatters > 0 then
        --   -- Extend the `clients` table with the registered formatters
        --   vim.list_extend(clients, supported_formatters)
        -- end
        --
        -- -- If the call to `list_registered_linters` was successful and there are more than 0 linters registered
        -- if linters_ok and #supported_linters > 0 then
        --   -- Extend the `clients` table with the registered linters
        --   vim.list_extend(clients, supported_linters)
        -- end
        --
        -- If there are more than 0 clients in the `clients` table
        if #clients > 0 then
          -- Return the clients concatenated as a string, separated by commas
          return (vim.o.columns > 100 and "%#St_LspStatus#" .. "   LSP ~ " .. table.concat(clients, ", ") .. " ")
            or "LS Inactive"
        end
      end)()
    end,
  },

  -- lazyload it when there are 1+ buffers
  tabufline = {
    show_numbers = false,
    enabled = true,
    lazyload = true,
    overriden_modules = nil,
  },

  nvdash = {
    load_on_startup = true,
    header = {
      "           ▄ ▄                   ",
      "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
      "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
      "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
      "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
      "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
      "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
      "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
      "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
    },

    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f r", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Find Projects", "Spc f p", "Telescope projects" },
      { "  Themes", "Spc f t", "Telescope themes" },
      { "  Mappings", "Spc n c", "NvCheatsheet" },
    },
  },

  cheatsheet = { theme = "grid" }, -- simple/grid
}
M.lazy_nvim = require "custom.configs.lazy" -- config for lazy.nvim startup options

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
