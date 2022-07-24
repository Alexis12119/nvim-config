local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local C = require "user.highlights.colors"

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  diagnostics_color = {
    error = { fg = C.red },
    warn = { fg = C.yellow },
  },
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  "diff",
  symbols = { added = " ", modified = " ", removed = " " },
  diff_color = {
    added = { fg = C.green },
    modified = { fg = C.yellow },
    removed = { fg = C.red },
  },
  cond = hide_in_width,
}

local branch = {
  "branch",
  icons_enabled = true,
  color = { fg = C.fg },
  icon = "",
}

local filesize = {
  function()
    local function format_file_size(file)
      local size = vim.fn.getfsize(file)
      if size <= 0 then
        return ""
      end
      local sufixes = { " B", " KB", " MB", " GB" }
      local i = 1
      while size > 1024 do
        size = size / 1024
        i = i + 1
      end
      return string.format("%.1f%s", size, sufixes[i])
    end

    local file = vim.fn.expand "%:p"
    if string.len(file) == 0 then
      return ""
    end
    return format_file_size(file)
  end,
  color = { fg = C.green },
}

local lsp = {
  function()
    local buf_clients = vim.lsp.buf_get_clients()
    local clients = {}

    -- add client
    for _, client in pairs(buf_clients) do
      if client.name ~= "null-ls" then
        table.insert(clients, client.name)
      end
    end

    if #clients > 0 then
      return table.concat(clients, ", ")
    else
      return "LS Inactive"
    end
  end,
  icon = " LSP:",
  color = { fg = C.magenta, gui = "bold" },
}

-- cool function for progress
local progress = function()
  local current_line = vim.fn.line "."
  local total_lines = vim.fn.line "$"
  local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

local spaces = {
  function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
  end,
  color = { fg = C.yellow },
}

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = "auto",
    component_separators = "",
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "dashboard" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { branch },
    lualine_c = { diagnostics },
    lualine_x = { lsp, "%=", diff, spaces, "filetype" },
    lualine_y = { filesize },
    lualine_z = { "progress", progress },
  },
}
