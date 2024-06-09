-- NOTE: Autocommands

local fn = vim.fn

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- General Settings
local general = augroup("General", { clear = true })

autocmd("VimEnter", {
  callback = function(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    -- change to the directory
    if directory then
      vim.cmd.cd(data.file)
      vim.cmd "Telescope find_files"
      -- require("nvim-tree.api").tree.open()
    end
  end,
  group = general,
  desc = "Open Telescope when it's a Directory",
})

-- Hide folds and Disable statuscolumn in these filetypes
autocmd("FileType", {
  pattern = { "sagaoutline", "nvcheatsheet" },
  callback = function()
    vim.opt_local.foldcolumn = "0"
    vim.opt_local.stc = "" -- not really important
  end,
  group = general,
  desc = "Disable Fold & StatusColumn",
})

-- Remove this if there's an issue
autocmd({ "BufReadPost", "BufNewFile" }, {
  once = true,
  callback = function()
    -- In wsl 2, just install xclip
    -- Ubuntu
    -- sudo apt install xclip
    -- Arch linux
    -- sudo pacman -S xclip
    vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
  end,
  group = general,
  desc = "Lazy load clipboard",
})

autocmd("TermOpen", {
  callback = function()
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.cmd "startinsert!"
  end,
  group = general,
  desc = "Terminal Options",
})

autocmd("BufReadPost", {
  callback = function()
    if fn.line "'\"" > 1 and fn.line "'\"" <= fn.line "$" then
      vim.cmd 'normal! g`"'
    end
  end,
  group = general,
  desc = "Go To The Last Cursor Position",
})

autocmd("TextYankPost", {
  callback = function()
    -- require("vim.highlight").on_yank { higroup = "Visual", timeout = 200 }
    require("vim.highlight").on_yank { timeout = 200 }
  end,
  group = general,
  desc = "Highlight when yanking",
})

-- autocmd({ "BufEnter", "BufNewFile" }, {
--   callback = function()
--     vim.o.showtabline = 0
--   end,
--   group = general,
--   desc = "Disable Tabline",
-- })

autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove { "c", "r", "o" }
  end,
  group = general,
  desc = "Disable New Line Comment",
})

autocmd("FileType", {
  pattern = { "c", "cpp", "py", "java", "cs" },
  callback = function()
    vim.bo.shiftwidth = 4
  end,
  group = general,
  desc = "Set shiftwidth to 4 in these filetypes",
})
--[[
autocmd({ "FocusLost", "BufLeave", "BufWinLeave", "InsertLeave" }, {
  -- nested = true, -- for format on save
  callback = function()
    if vim.bo.filetype ~= "" and vim.bo.buftype == "" then
      vim.cmd "silent! w"
    end
  end,
  group = general,
  desc = "Auto Save",
})
]]
autocmd("FocusGained", {
  callback = function()
    vim.cmd "checktime"
  end,
  group = general,
  desc = "Update file when there are changes",
})

autocmd("VimResized", {
  callback = function()
    vim.cmd "wincmd ="
  end,
  group = general,
  desc = "Equalize Splits",
})

autocmd("ModeChanged", {
  callback = function()
    if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
      vim.opt.hlsearch = true
    else
      -- vim.opt.hlsearch = false
    end
  end,
  group = general,
  desc = "Highlighting matched words when searching",
})

autocmd("FileType", {
  pattern = { "gitcommit", "markdown", "text", "log" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
  group = general,
  desc = "Enable Wrap in these filetypes",
})

local overseer = augroup("Overseer", { clear = true })

autocmd("FileType", {
  pattern = "OverseerList",
  callback = function()
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.cmd "startinsert!"
  end,
  group = overseer,
  desc = "Enter Normal Mode In OverseerList",
})

-- For Godot
local godot = augroup("Godot", { clear = true })

autocmd("FileType", {
  pattern = { "gdscript" },
  callback = function()
    vim.g.godot = true
    local port = os.getenv "GDScript_Port" or "6005"
    local cmd = vim.lsp.rpc.connect("127.0.0.1", port)
    local pipe = "/tmp/godot.pipe"

    vim.lsp.start {
      name = "godot",
      cmd = cmd,
      root_dir = vim.fs.dirname(vim.fs.find({ "project.godot" }, { upward = true })[1]),
      on_attach = function(_, _)
        vim.api.nvim_command('echo serverstart("' .. pipe .. '")')
      end,
    }
  end,
  group = godot,
  desc = "Start Godot LSP",
})

local copilotchat = augroup("copilotchat", { clear = true })

-- Source: https://github.com/CopilotC-Nvim/CopilotChat.nvim#customizing-buffers
autocmd("BufEnter", {
  desc = "CopilotChat Autocommand",
  pattern = "copilot-*",
  callback = function()
    vim.opt_local.relativenumber = true
    -- C-p to print last response
    vim.keymap.set("n", "<C-p>", function()
      print(require("CopilotChat").response())
    end, { buffer = true, remap = true })
  end,
  group = copilotchat,
})

local copilot = augroup("copilot", { clear = true })

autocmd("ColorScheme", {
  pattern = "solarized",
  callback = function()
    vim.api.nvim_set_hl(0, "CopilotSuggestion", {
      ctermfg = 8,
      force = true,
    })
  end,
  group = copilot,
})

local kevinnitro = augroup("kevinnitro", { clear = true })

-- Restore terminal i-beam cursor
-- https://github.com/microsoft/terminal/issues/13420
autocmd("VimLeave", {
  desc = "Restore Cursor when VimLeave",
  command = "set guicursor= | call chansend(v:stderr, '\x1b[ q')",
  group = kevinnitro,
})

autocmd("BufReadPost", {
  desc = "Set JSON to JSONC",
  pattern = "*.json",
  command = "set filetype=jsonc",
  group = kevinnitro,
})

autocmd("BufReadPost", {
  desc = "Set tab width to 2 for some filetype",
  pattern = { "*.json", "*.markdown", "*.yaml", "*toml", "*.js", "*.ts" },
  command = "set tabstop=2 shiftwidth=2 expandtab",
  group = kevinnitro,
})

autocmd("BufReadPost", {
  desc = "Set tab width to 4 for some filetype",
  pattern = { "*.c", "*.cpp", "*.cs", "*.h", "*.py" },
  command = "set tabstop=4 shiftwidth=4 expandtab",
  group = kevinnitro,
})
