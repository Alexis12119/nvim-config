-- NOTE: Autocommands

-- ====================================================================
-- Neovim Autocommands Configuration
-- These autocommands are automatically loaded after the "VeryLazy" event.
-- Reference (LazyVim defaults): https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Use this file to define custom autocmds or override defaults.
-- You can remove LazyVim defaults by group name (prefixed with "lazyvim_").
-- Example: vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- ====================================================================

-- Shortcuts
local fn = vim.fn
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- ====================================================================
-- General Autocommands
-- ====================================================================
local general = augroup("General", { clear = true })

-- --------------------------------------------------------------------
-- Terminal Behavior
-- --------------------------------------------------------------------
-- Disables line numbers in terminal buffers and auto-enters insert mode.
-- Keeps the terminal clean and ready for immediate input.
autocmd("TermOpen", {
  callback = function()
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.cmd("startinsert!")
  end,
  group = general,
  desc = "Configure terminal window options",
})

-- --------------------------------------------------------------------
-- Disable Auto Comment on New Line
-- --------------------------------------------------------------------
-- Prevents Neovim from automatically adding comment prefixes
-- when you press <Enter> or "o" on a commented line.
autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
  group = general,
  desc = "Disable automatic comment continuation",
})

-- --------------------------------------------------------------------
-- Disable Readonly Prompt (E.g., W10 Warning)
-- --------------------------------------------------------------------
-- Automatically removes the readonly flag if triggered by FileChangedRO.
-- Useful when editing files restored or reopened from external changes.
autocmd("FileChangedRO", {
  callback = function()
    vim.bo.readonly = false
  end,
  group = general,
  desc = "Automatically disable readonly mode on change",
})

-- --------------------------------------------------------------------
-- Auto Save on Focus Lost or Buffer Leave
-- --------------------------------------------------------------------
-- Automatically saves changes when you leave a buffer or Neovim loses focus.
-- Only triggers for normal file buffers (not terminals or help).
autocmd({ "FocusLost", "BufLeave", "BufWinLeave", "InsertLeave" }, {
  callback = function()
    if vim.bo.filetype ~= "" and vim.bo.buftype == "" and vim.bo.modified then
      vim.cmd("silent! w")
    end
  end,
  group = general,
  desc = "Auto-save modified buffers on focus or mode change",
})

-- --------------------------------------------------------------------
-- Notify When File is Reloaded
-- --------------------------------------------------------------------
-- When an external change causes the file to reload, this provides
-- a visible notification for user feedback.
autocmd("FileChangedShellPost", {
  callback = function()
    vim.notify("File reloaded automatically", vim.log.levels.INFO, { title = "nvim" })
  end,
  group = general,
  desc = "Notify user when file is reloaded automatically",
})

-- --------------------------------------------------------------------
-- Equalize Split Sizes on Resize
-- --------------------------------------------------------------------
-- Keeps all split windows evenly sized when resizing the Neovim window.
autocmd("VimResized", {
  callback = function()
    vim.cmd("wincmd =")
  end,
  group = general,
  desc = "Equalize window splits on terminal resize",
})

-- --------------------------------------------------------------------
-- Dynamic Search Highlighting
-- --------------------------------------------------------------------
-- Automatically hides search highlights while typing (insert mode)
-- and shows them again in normal or visual modes.
autocmd("ModeChanged", {
  pattern = "*",
  callback = function()
    local mode = vim.fn.mode()
    if mode:match("i") then
      vim.opt.hlsearch = false -- Hide highlights while typing
    else
      vim.opt.hlsearch = true -- Show them when navigating or searching
    end
  end,
  group = general,
  desc = "Toggle search highlight visibility by mode",
})

-- --------------------------------------------------------------------
-- Enable Soft Wrap and Spellcheck in Text-like Filetypes
-- --------------------------------------------------------------------
-- Enables word wrapping and spell checking for writing-oriented filetypes.
autocmd("FileType", {
  pattern = { "gitcommit", "markdown", "text", "log" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
  group = general,
  desc = "Enable wrap and spellcheck for writing filetypes",
})

-- ====================================================================
-- Overseer Plugin Integration
-- ====================================================================
local overseer = augroup("Overseer", { clear = true })

-- When viewing Overseer task list windows, disable line numbers and enter insert mode.
autocmd("FileType", {
  pattern = "OverseerList",
  callback = function()
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.cmd("startinsert!")
  end,
  group = overseer,
  desc = "Configure OverseerList UI behavior",
})

-- ====================================================================
-- ⏱️ Periodic File Change Checker
-- ====================================================================
-- Timer-based file change detection to ensure files modified outside of Neovim
-- are reloaded automatically even in TUI mode (no GUI notifications).
-- Runs every 5 seconds to check timestamps and triggers :checktime.
local file_check_timer = nil
local last_check = {}

autocmd("VimEnter", {
  callback = function()
    file_check_timer = fn.timer_start(5000, function()
      local bufnr = vim.api.nvim_get_current_buf()
      local fname = vim.api.nvim_buf_get_name(bufnr)
      if fname == "" then
        return
      end

      local current_time = fn.getftime(fname)
      if current_time == -1 then
        return
      end

      if last_check[bufnr] and current_time > last_check[bufnr] then
        vim.cmd("checktime")
      end

      last_check[bufnr] = current_time
    end, { ["repeat"] = -1 })
  end,
  group = general,
  desc = "Start background timer for file change detection",
})

autocmd("VimLeave", {
  callback = function()
    if file_check_timer then
      fn.timer_stop(file_check_timer)
    end
  end,
  group = general,
  desc = "Stop background file watcher on exit",
})

-- ====================================================================
-- LSP Enhancements
-- ====================================================================
-- Triggered when an LSP client attaches to a buffer.
-- 1. Disables semantic tokens (for better performance or visual consistency)
-- 2. Integrates workspace-wide diagnostics through workspace-diagnostics.nvim
autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then
      return
    end

    -- NOTE: Disable Semantic Tokens
    local lsp_groups = vim.fn.getcompletion("@lsp", "highlight")
    for _, group in ipairs(lsp_groups) do
      vim.api.nvim_set_hl(0, group, {})
    end

    -- Populate workspace diagnostics (external plugin)
    require("workspace-diagnostics").populate_workspace_diagnostics(client, vim.api.nvim_get_current_buf())
  end,
  desc = "Customize LSP behavior and populate workspace diagnostics",
})
