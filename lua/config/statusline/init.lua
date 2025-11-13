local M = {}

local function get_venv(variable)
  local venv = os.getenv(variable)
  if venv ~= nil and string.find(venv, "/") then
    local orig_venv = venv
    for w in orig_venv:gmatch("([^/]+)") do
      venv = w
    end
    venv = string.format("%s", venv)
  end
  return venv
end

M.modules = {
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
      return "%#StText# %L "
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

    local venv = get_venv("CONDA_DEFAULT_ENV") or get_venv("VIRTUAL_ENV") or " "
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
    local buf = vim.api.nvim_get_current_buf()

    -- Preallocate small tables
    local clients = {}
    local added = {} -- For deduplication (faster than vim.tbl_contains)

    -- Collect LSP clients
    local lsp_clients = vim.lsp.get_clients({ bufnr = buf })
    for i = 1, #lsp_clients do
      local name = lsp_clients[i].name
      clients[#clients + 1] = name
      added[name] = true
    end

    -- Collect linters (if available)
    local ok_lint, lint = pcall(require, "lint")
    if ok_lint then
      local linters_by_ft = lint.linters_by_ft
      if linters_by_ft then
        for ft in vim.gsplit(vim.bo.filetype, ".", { plain = true, trimempty = true }) do
          local linters = linters_by_ft[ft]
          if linters then
            for j = 1, #linters do
              local name = linters[j]
              if not added[name] then
                clients[#clients + 1] = name
                added[name] = true
              end
            end
          end
        end
      end
    end

    -- Collect formatters (if available)
    local ok_conform, conform = pcall(require, "conform")
    if ok_conform and conform.list_formatters then
      local formatters = conform.list_formatters(0)
      for i = 1, #formatters do
        local name = formatters[i].name
        if not added[name] then
          clients[#clients + 1] = name
          added[name] = true
        end
      end
    end

    local count = #clients
    if count == 0 then
      return ""
    end

    if vim.o.columns > 100 then
      return " %#St_gitIcons#" .. table.concat(clients, ", ") .. " "
    else
      return "  LSP "
    end
  end,
}

return M
