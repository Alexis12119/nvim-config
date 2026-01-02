-- ESLint utilities

local M = {}

M.pick_eslint_config = function(callback)
  local cwd = vim.fn.getcwd()

  local ignored_dirs = {
    "node_modules",
    ".git",
    "dist",
    "build",
    "coverage",
  }

  -- Recursive finder that skips ignored directories
  local files = vim.fs.find(function(name, path)
    -- Skip ignored directories entirely
    for _, ignore in ipairs(ignored_dirs) do
      if path:find("/" .. ignore .. "/") then
        return false
      end
    end
    return name == "eslint.config.js"
  end, { path = cwd, type = "file", limit = math.huge })

  if not files or #files == 0 then
    vim.notify("No eslint.config.js files found in current directory.", vim.log.levels.WARN)
    return
  end

  local display = {}
  for _, path in ipairs(files) do
    local rel = vim.fn.fnamemodify(path, ":.")
    table.insert(display, rel)
  end

  vim.ui.select(display, { prompt = "Select which eslint.config.js to use:" }, function(choice)
    if not choice then
      vim.notify("ESLint config selection cancelled.", vim.log.levels.INFO)
      return
    end

    local selected_path = cwd .. "/" .. choice
    vim.notify("Using ESLint config: " .. selected_path, vim.log.levels.INFO)

    if callback then
      callback(selected_path)
    end
  end)
end

M.lint_project = function()
  M.pick_eslint_config(function(config_path)
    local root = vim.fn.fnamemodify(config_path, ":h")
    local cmd = "npm run lint"
    local output = {}

    vim.fn.jobstart(cmd, {
      cwd = root,
      stdout_buffered = true,
      stderr_buffered = true,
      on_stdout = function(_, data)
        if data then
          vim.list_extend(output, data)
        end
      end,
      on_stderr = function(_, data)
        if data then
          vim.list_extend(output, data)
        end
      end,
      on_exit = function()
        local qf_list = {}
        local current_file = nil

        for _, line in ipairs(output) do
          -- Skip info / empty lines
          if line:match("^>") or line:match("^info") or line:match("^$") then
            goto continue
          end

          -- File header lines
          if line:match("^%./") then
            current_file = line:match("^%./(.*)")
            goto continue
          end

          -- Messages: line:col  type: message
          local lnum, col, msg = line:match("^(%d+):(%d+)%s+(.*)")
          if lnum and col and msg and current_file then
            -- Optional: prepend icons like in your buffer
            -- local icon = msg:match "Error:" and "" or msg:match "Warning:" and "" or ""
            table.insert(qf_list, {
              filename = root .. "/" .. current_file,
              lnum = tonumber(lnum),
              col = tonumber(col),
              text = msg,
            })
          end
          ::continue::
        end

        if #qf_list == 0 then
          vim.notify(" No ESLint issues found.", vim.log.levels.INFO)
          vim.fn.setqflist({})
          return
        end

        vim.fn.setqflist({}, " ", { title = "ESLint", items = qf_list })
        vim.cmd("copen")
      end,
    })
  end)
end

return M