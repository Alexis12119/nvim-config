-- NOTE: Commands
local command = vim.api.nvim_create_user_command

command("Format", function(args)
  local status_ok, conform = pcall(require, "conform")
  if not status_ok then
    return vim.notify "conform.nvim isn't installed!!!"
  end

  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  conform.format { async = true, lsp_format = "fallback", range = range }
  vim.notify("Format Done", vim.log.levels.INFO, { title = "Format" })
end, { nargs = "*", desc = "Code Format", range = true })

command("FormatDisable", function(args)
  if args.bang then
    vim.b.disable_autoformat = true
    vim.notify("Disable Autoformat (Local)", vim.log.levels.INFO, { title = "Format" })
  else
    vim.g.disable_autoformat = true
    vim.notify("Disable Autoformat", vim.log.levels.INFO, { title = "Format" })
  end
end, { desc = "Disable Autoformat", bang = true })

command("FormatEnable", function(args)
  if args.bang then
    vim.b.disable_autoformat = false
    vim.notify("Enable Autoformat (Local)", vim.log.levels.INFO, { title = "Format" })
  else
    vim.g.disable_autoformat = false
    vim.notify("Enable Autoformat", vim.log.levels.INFO, { title = "Format" })
  end
end, { desc = "Enable Autoformat", bang = true })

command("FormatToggle", function(args)
  if args.bang then
    if vim.b.disable_autoformat then
      vim.cmd "FormatEnable!"
    else
      vim.cmd "FormatDisable!"
    end
  else
    if vim.g.disable_autoformat then
      vim.cmd "FormatEnable"
    else
      vim.cmd "FormatDisable"
    end
  end
end, { desc = "Toggle Autoformat", bang = true })

command("LuaSnipEdit", function()
  require("luasnip.loaders").edit_snippet_files()
end, { nargs = "*", desc = "Edit the available snippets in the filetype" })

command("RemoveEmptyLines", function()
  vim.cmd ":g/^$/d"
  -- :v/./d
  --
  -- :g/^\s*$/d
  -- :v/\S/d
end, { nargs = "*", desc = "Remove all empty lines" })

command("RemoveTrailingSpaces", function()
  vim.cmd ":%s/s+$//e"
end, { nargs = "*", desc = "Remove all trailing spaces " })
