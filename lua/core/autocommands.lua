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

-- Enable Line Number in Telescope Preview
autocmd("User", {
  pattern = "TelescopePreviewerLoaded",
  callback = function()
    vim.opt_local.number = true
  end,
  group = general,
  desc = "Enable Line Number in Telescope Preview",
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

autocmd("FileType", {
  desc = "Set tab width to 2 for specific filetypes",
  pattern = { "json", "markdown", "yaml", "toml", "javascript", "typescript", "html", "htmlx", "jsonc" },
  command = "set tabstop=2 shiftwidth=2 expandtab",
  group = general,
})

autocmd("FileType", {
  desc = "Set tab width to 4 for specific filetypes",
  pattern = { "c", "cpp", "cs", "py" },
  command = "set tabstop=4 shiftwidth=4 expandtab",
  group = general,
})

-- NOTE: Taken from LazyVim documentation: https://www.lazyvim.org/configuration/general#auto-commands

local lazyvim = augroup("lazyvim", { clear = true })

-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = lazyvim,
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
    "dbout",
    "gitsigns.blame",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Make it easier to close man-files when opened inline
vim.api.nvim_create_autocmd("FileType", {
  group = lazyvim,
  pattern = { "man" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = lazyvim,
  callback = function(event)
    if event.match:match "^%w%w+:[\\/][\\/]" then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = lazyvim,
  pattern = "bigfile",
  callback = function(ev)
    vim.b.minianimate_disable = true
    vim.b.cinnamon_disable = true
    vim.schedule(function()
      vim.bo[ev.buf].syntax = vim.filetype.match { buf = ev.buf } or ""
    end)
  end,
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

local copilot = augroup("copilot", { clear = true })

autocmd("ColorScheme", {
  pattern = "solarized",
  callback = function()
    vim.api.nvim_set_hl(0, "CopilotSuggestion", {
      ctermfg = "light_grey",
      fg = "light_grey",
      force = true,
    })
  end,
  group = copilot,
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

local settings = augroup("settings", { clear = true })

-- Docs about change vim cursor in terminal: https://neovim.io/doc/user/faq.html#faq
autocmd({ "VimEnter", "VimResume" }, {
  desc = "Set Cursor in Neovim",
  command = "set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:Cursor/lCursor,sm:block",
  group = settings,
})

autocmd({ "VimLeave", "VimSuspend" }, {
  desc = "Restore Cursor when exit Neovim",
  command = "set guicursor=a:ver25",
  group = settings,
})

-- Restore terminal i-beam cursor
-- https://github.com/microsoft/terminal/issues/13420
-- autocmd("VimLeave", {
--   desc = "Restore Cursor when VimLeave",
--   command = "set guicursor= | call chansend(v:stderr, '\x1b[ q')",
--   group = settings,
-- })
