local M = {}

local default_symbols = {
  spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
  done = "✓",
  separator = " ",
}

-- Track ongoing LSP progress
local lsp_work_by_client_id = {}

M.clients = function()
  local result = {}
  local buf = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = buf }) or {}

  local hrtime = (vim.uv or vim.loop).hrtime
  local spinner_symbol = default_symbols.spinner[math.floor(hrtime() / (1e6 * 80)) % #default_symbols.spinner + 1]

  local processed = {}

  -- LSP clients (spinner now at the front)
  for _, client in ipairs(clients) do
    local work = lsp_work_by_client_id[client.id]
    local status = ""
    if work and work > 0 then
      status = spinner_symbol
    elseif work and work == 0 then
      status = default_symbols.done
    end

    local name = client.name
    if not processed[name] then
      if status ~= "" then
        table.insert(result, status .. " " .. name)
      else
        table.insert(result, name)
      end
      processed[name] = true
    end
  end

  -- Add linters
  local lint_ok, lint = pcall(require, "lint")
  if lint_ok then
    local linters = {}
    local fts = vim.split(vim.bo.filetype, ".", { plain = true, trimempty = true })
    for _, ft in pairs(fts) do
      vim.list_extend(linters, lint.linters_by_ft[ft] or {})
    end
    if #linters > 0 then
      table.insert(result, table.concat(linters, ", "))
    end
  end

  -- Add formatters
  local conform_ok, conform = pcall(require, "conform")
  if conform_ok then
    local formatters = conform.list_formatters(0)
    for _, formatter in pairs(formatters) do
      if not vim.tbl_contains(result, formatter.name) then
        table.insert(result, formatter.name)
      end
    end
  end

  if #result == 0 then
    return ""
  else
    return (vim.o.columns > 100 and (table.concat(result, default_symbols.separator) .. " ")) or "  LSP "
  end
end

local function get_venv(variable)
  local venv = os.getenv(variable)
  if venv ~= nil and string.find(venv, "/") then
    for w in venv:gmatch("([^/]+)") do
      venv = w
    end
  end
  return venv
end

M.python_venv = function()
  if vim.bo.filetype ~= "python" then
    return " "
  end

  local venv = get_venv("CONDA_DEFAULT_ENV") or get_venv("VIRTUAL_ENV") or " "
  if venv == " " then
    return " "
  else
    return " " .. venv
  end
end

return M
