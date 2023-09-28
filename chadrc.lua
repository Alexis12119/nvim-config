---@type ChadrcConfig
local M = {}

local highlights = require "custom.highlights"

M.ui = {
  theme = "kanagawa",
  theme_toggle = { "kanagawa", "one_light" },
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
    theme = "minimal", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "round",
    overriden_modules = function(modules)
      local config = require("core.utils").load_config().ui.statusline
      local sep_style = config.separator_style

      sep_style = (sep_style ~= "round" and sep_style ~= "block") and "block" or sep_style

      local default_sep_icons = {
        round = { left = "", right = "" },
        block = { left = "█", right = "█" },
      }

      local separators = (type(sep_style) == "table" and sep_style) or default_sep_icons[sep_style]

      local sep_l = separators["left"]
      local sep_r = "%#St_sep_r#" .. separators["right"] .. " %#ST_EmptySpace#"

      local function gen_block(icon, txt, sep_l_hlgroup, iconHl_group, txt_hl_group)
        return sep_l_hlgroup .. sep_l .. iconHl_group .. icon .. " " .. txt_hl_group .. " " .. txt .. sep_r
      end

      local noice_ok, noice = pcall(require, "noice")
      modules[6] = (function()
        if not noice_ok then
          return " "
        end
        return noice.api.status.mode.get() .. " "
      end)()
      modules[7] = (function()
        if not noice_ok then
          return " "
        end
        return noice.api.status.command.get() .. " "
      end)()
      modules[9] = (function()
        local clients = {}
        local bufnr = vim.api.nvim_get_current_buf()

        -- Iterate through all the clients for the current buffer
        for _, client in pairs(vim.lsp.get_active_clients { bufnr = bufnr }) do
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
          return (
            vim.o.columns > 100
            and gen_block("", table.concat(clients, ", "), "%#St_lsp_sep#", "%#St_lsp_bg#", "%#St_lsp_txt#")
          ) or "  LSP "
        end
      end)()
      modules[11] = (function()
        return gen_block("", "%L", "%#St_Pos_sep#", "%#St_Pos_bg#", "%#St_Pos_txt#")
      end)()
    end,
  },

  -- lazyload it when there are 1+ buffers
  tabufline = {
    show_numbers = false,
    enabled = true,
    lazyload = true,
    -- overriden_modules = function(modules)
    --   modules[3] = (function()
    --     return "%#TblineFill#%@v:lua.ClickUpdate@  %#TblineFill#%@v:lua.ClickGit@  %#TblineFill#%@v:lua.RunCode@  %#TblineFill#%@v:lua.ClickSplit@ "
    --   end)()
    -- end,
  },

  nvdash = {
    load_on_startup = false,
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
