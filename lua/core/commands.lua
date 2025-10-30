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
end, { desc = "Edit the available snippets in the filetype" })

command("RemoveTrailingSpaces", function()
  vim.cmd ":%s/s+$//e"
end, { desc = "Remove all trailing spaces" })

command("AppendToEnd", function(args)
  local prefix = args.line1 .. "," .. args.line2
  local chars = args.fargs[1] ~= nil and args.fargs[1] or ";"
  vim.cmd(prefix .. "g/./normal A" .. chars)
  vim.cmd "nohlsearch"
end, { nargs = "?", desc = 'Append char(s) to end of each line (Default: ";")', range = true })

command("JoinEmptyLines", function(args)
  -- We need silent! because if no match pattern, it will notify error
  if args.fargs[1] ~= nil then
    vim.cmd("silent! g/^$/,/./-" .. args.fargs[1] .. "j") -- Max "n" empty line(s)
  elseif args.bang then
    vim.cmd "silent! g/^$/-j" -- No empty line
  else
    vim.cmd "silent! g/^$/,/./-1j" -- Join max 1 empty line
  end
  vim.cmd [[%s/\_s*\%$//e]] -- remove the last empty lines
  vim.cmd "nohlsearch"
end, { desc = "Join empty lines", bang = true, nargs = "?" })

command("DiscordRichPresence", function()
  vim.g.disable_discord_rich_presence = not vim.g.disable_discord_rich_presence

  if not vim.g.disable_discord_rich_presence then
    vim.notify("Discord Rich Presence: Enabled", vim.log.levels.INFO, { title = "cord.nvim" })
    vim.cmd "Cord enable"
  else
    vim.notify("Discord Rich Presence: Disabled", vim.log.levels.INFO, { title = "cord.nvim" })
    vim.cmd "Cord disable"
  end
end, { desc = "Toggle Discord Rich Presence" })
command("EslintRun", function()
  require("core.utils").lint_project()
end, { desc = "Run ESLint (npm run lint)" })
