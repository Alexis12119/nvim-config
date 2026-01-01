-- NOTE: Commands

-- ====================================================================
-- User Commands Configuration
-- Define custom Neovim commands using `vim.api.nvim_create_user_command`
-- ====================================================================

local command = vim.api.nvim_create_user_command

-- --------------------------------------------------------------------
-- LuaSnip: Edit Snippet Files
-- --------------------------------------------------------------------
-- Useful for quickly editing or creating snippets managed by LuaSnip.
command("LuaSnipEdit", function()
  require("luasnip.loaders").edit_snippet_files()
end, {
  desc = "Edit available snippets for the current filetype",
})

-- --------------------------------------------------------------------
-- Remove Trailing Whitespace
-- --------------------------------------------------------------------
-- Removes all trailing spaces in the current buffer.
-- The `e` flag suppresses errors if no matches are found.
-- Great for keeping your codebase clean before commits.
command("RemoveTrailingSpaces", function()
  vim.cmd(":%s/s+$//e")
end, {
  desc = "Remove all trailing spaces in the current buffer",
})

-- --------------------------------------------------------------------
-- Append Character(s) to Each Line
-- --------------------------------------------------------------------
-- Appends a character (or string) to the end of each non-empty line
-- within a given range. By default, it appends a semicolon (";").
--
-- Usage examples:
--   :AppendToEnd              → Append ";" to all lines
--   :10,20AppendToEnd ","     → Append "," to lines 10–20
--
-- `args.line1` and `args.line2` define the selected range.
-- `args.fargs[1]` allows custom characters to append.
command("AppendToEnd", function(args)
  local prefix = args.line1 .. "," .. args.line2
  local chars = args.fargs[1] ~= nil and args.fargs[1] or ";"
  vim.cmd(prefix .. "g/./normal A" .. chars)
  vim.cmd("nohlsearch")
end, {
  nargs = "?",
  range = true,
  desc = 'Append char(s) to the end of each line (default: ";")',
})

-- --------------------------------------------------------------------
-- Join Empty Lines
-- --------------------------------------------------------------------
-- Joins lines separated by empty lines to reduce blank spacing.
-- There are three usage modes:
--   1. `:JoinEmptyLines`       → Joins consecutive empty lines (max 1)
--   2. `:JoinEmptyLines 3`     → Joins when ≤ 3 empty lines in between
--   3. `:JoinEmptyLines!`      → Completely remove all empty lines
--
-- The final substitution cleans up trailing blank lines at EOF.
-- Uses `silent!` to prevent errors if no matching patterns exist.
command("JoinEmptyLines", function(args)
  if args.fargs[1] ~= nil then
    -- Custom maximum number of empty lines to join
    vim.cmd("silent! g/^$/,/./-" .. args.fargs[1] .. "j")
  elseif args.bang then
    -- Force join: remove *all* empty lines
    vim.cmd("silent! g/^$/-j")
  else
    -- Default behavior: join single empty lines
    vim.cmd("silent! g/^$/,/./-1j")
  end

  -- Remove trailing empty lines at the end of file
  vim.cmd([[%s/\_s*\%$//e]])
  vim.cmd("nohlsearch")
end, {
  desc = "Join or remove empty lines",
  bang = true,
  nargs = "?",
})

-- --------------------------------------------------------------------
-- Toggle Discord Rich Presence (cord.nvim)
-- --------------------------------------------------------------------
-- Toggles the integration with Discord Rich Presence plugin (`cord.nvim`).
-- Displays a notification when toggled and runs the appropriate command:
--   :Cord enable  → Starts showing your Neovim status on Discord
--   :Cord disable → Stops it
--
-- Stores toggle state in `vim.g.disable_discord_rich_presence`.
command("DiscordRichPresence", function()
  vim.g.disable_discord_rich_presence = not vim.g.disable_discord_rich_presence

  if not vim.g.disable_discord_rich_presence then
    vim.notify("Discord Rich Presence: Enabled", vim.log.levels.INFO, { title = "cord.nvim" })
    vim.cmd("Cord enable")
  else
    vim.notify("Discord Rich Presence: Disabled", vim.log.levels.INFO, { title = "cord.nvim" })
    vim.cmd("Cord disable")
  end
end, {
  desc = "Toggle Discord Rich Presence (cord.nvim)",
})

-- --------------------------------------------------------------------
-- Clear Vim Registers
-- --------------------------------------------------------------------
-- Clears most commonly used registers to avoid clipboard/yank pollution.
-- This includes:
--   - unnamed register (")
--   - numbered registers (0–9)
--   - named registers (a–z, A–Z)
--   - small delete (-)
--   - search register (/)
--
-- Does NOT touch system clipboard (+, *) by default.
command("ClearRegisters", function()
  local regs = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"'
  for r in regs:gmatch('.') do
    vim.fn.setreg(r, '')
  end
  vim.notify("Registers cleared", vim.log.levels.INFO, { title = "Neovim" })
end, {
  desc = "Clear yank/delete registers",
})
