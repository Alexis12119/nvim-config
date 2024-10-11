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

local highlights = require "highlights"

M.ui = {
  telescope = { style = "borderless" }, -- borderless / bordered
  cmp = {
    style = "atom", -- default/flat_light/flat_dark/atom/atom_colored
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
    modules = {
      -- NOTE: Add colors to the git status

      -- git = function()
      --   local stbufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
      --   if not vim.b[stbufnr].gitsigns_head or vim.b[stbufnr].gitsigns_git_status then
      --     return ""
      --   end
      --
      --   local git_status = vim.b[stbufnr].gitsigns_status_dict
      --
      --   local added = (git_status.added and git_status.added ~= 0) and ("  " .. git_status.added) or ""
      --   local changed = (git_status.changed and git_status.changed ~= 0) and ("  " .. git_status.changed) or ""
      --   local removed = (git_status.removed and git_status.removed ~= 0) and ("  " .. git_status.removed) or ""
      --   local branch_name = " " .. git_status.head
      --
      --   return " "
      --     .. "%#St_gitIcons#"
      --     .. branch_name
      --     .. "%#GitSignsAdd#"
      --     .. added
      --     .. "%#GitSignsChange#"
      --     .. changed
      --     .. "%#GitSignsDelete#"
      --     .. removed
      -- end,

      total_lines = function()
        local separators = {}
        local config = require("nvconfig").ui.statusline
        local theme = config.theme
        local sep_style = config.separator_style

        local mode = {
          default = {
            default = { left = "", right = "" },
            round = { left = "", right = "" },
            block = { left = "█", right = "█" },
            arrow = { left = "", right = "" },
          },
          minimal = {
            default = { left = "█", right = "█" },
            round = { left = "", right = "" },
            block = { left = "█", right = "█" },
            arrow = { left = "█", right = "█" },
          },
          vscode = {
            default = { left = "█", right = "█" },
            round = { left = "", right = "" },
            block = { left = "█", right = "█" },
            arrow = { left = "", right = "" },
          },
          vscode_colored = {
            default = { left = "█", right = "█" },
            round = { left = "", right = "" },
            block = { left = "█", right = "█" },
            arrow = { left = "", right = "" },
          },
        }

        separators = (type(sep_style) == "table" and sep_style) or mode[theme][sep_style]

        local sep_l = separators["left"]
        local sep_end = "%#St_sep_r#" .. separators["right"]

        -- From: NvChad/ui
        local function gen_block(icon, txt, sep_l_hlgroup, iconHl_group, txt_hl_group)
          return sep_l_hlgroup .. sep_l .. iconHl_group .. icon .. " " .. txt_hl_group .. " " .. txt .. sep_end
        end

        if theme == "default" then
          return "%#St_pos_sep#" .. sep_l .. "%#St_pos_icon# %#St_pos_text# %p %% "
        elseif theme == "vscode" or theme == "vscode_colored" then
          return "%#StText# %L"
        end
        return gen_block("", "%L", "%#St_Pos_sep#", "%#St_Pos_bg#", "%#St_Pos_txt#")
      end,

      harpoon = function()
        -- simplified version of this https://github.com/letieu/harpoon-lualine
        local options = {
          icon = "󰀱 ",
          indicators = { "1", "2", "3", "4" },
          active_indicators = { "[1]", "[2]", "[3]", "[4]" },
          separator = " ",
        }
        local list = require("harpoon"):list()
        local root_dir = list.config:get_root_dir()
        local current_file_path = vim.api.nvim_buf_get_name(0)

        local length = math.min(list:length(), #options.indicators)

        local status = {}
        local get_full_path = function(root, value)
          return root .. vim.g.path_separator .. value
        end

        for i = 1, length do
          local value = list:get(i).value
          local full_path = get_full_path(root_dir, value)

          if full_path == current_file_path then
            table.insert(status, options.active_indicators[i])
          else
            table.insert(status, options.indicators[i])
          end
        end

        return table.concat(status, options.separator)
      end,

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
        for _, client in pairs(vim.lsp.get_clients { bufnr = buf }) do
          -- Add the client name to the `clients` table
          table.insert(clients, client.name)
        end

        local lint_ok, lint = pcall(require, "lint")
        if lint_ok then
          local linters = {}
          local fts = vim.split(vim.bo.filetype, ".", { plain = true, trimempty = true })
          for _, ft in pairs(fts) do
            vim.list_extend(linters, lint.linters_by_ft[ft] or {})
          end
          if #linters ~= 0 then
            table.insert(clients, table.concat(linters, ", "))
          end
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

  tabufline = {
    enabled = true,
    order = { "treeOffset", "buffers", "tabs", "btns" },
    modules = {
      blank = function()
        return "%#Normal#" .. "%=" -- empty space
      end,
      -- custom_btns = function()
      --   return " %#Normal#%@v:lua.ClickGit@  %#Normal#%@v:lua.RunCode@  %#Normal#%@v:lua.ClickSplit@  "
      -- end,
    },
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
  theme = "mountain",
  theme_toggle = { "mountain", "one_light" },
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
