local fn = vim.fn

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- General Settings
local general = augroup("General Settings", { clear = true })

autocmd("VimEnter", {
  callback = function(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    -- change to the directory
    if directory then
      vim.cmd.cd(data.file)
      -- open the tree
      require("nvim-tree.api").tree.open()
    end
  end,
  group = general,
  desc = "Open NvimTree when it's a Directory",
})

autocmd("User", {
  pattern = "AlphaReady",
  callback = function()
    vim.opt.cmdheight = 0
    vim.opt.showtabline = 0
    vim.opt.laststatus = 0

    autocmd("BufUnload", {
      pattern = "<buffer>",
      callback = function()
        vim.opt.cmdheight = 1
        vim.opt.showtabline = 2
        vim.opt.laststatus = 3
      end,
    })
  end,
  desc = "Disable Bufferline And Lualine in Alpha",
})

-- remove this if there's an issue
autocmd({"BufReadPost", "BufNewFile"}, {
  once = true,
  callback = function()
    if vim.fn.has "wsl" == 1 then
      -- Set a compatible clipboard manager
      vim.g.clipboard = {
        copy = {
          ["+"] = "win32yank.exe -i --crlf",
          ["*"] = "win32yank.exe -i --crlf",
        },
        paste = {
          ["+"] = "win32yank.exe -o --lf",
          ["*"] = "win32yank.exe -o --lf",
        },
      }
    end

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
    require("vim.highlight").on_yank { higroup = "YankHighlight", timeout = 200 }
  end,
  group = general,
  desc = "Highlight when yanking",
})

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

autocmd("BufEnter", {
  callback = function()
    vim.cmd "silent! lcd %:p:h"
  end,
  group = general,
  desc = "Auto Change Directory",
})

autocmd("BufModifiedSet", {
  callback = function()
    vim.cmd "silent! w"
  end,
  group = general,
  desc = "Auto Save",
})

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
      vim.opt.hlsearch = false
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

autocmd("BufWritePost", {
  pattern = "*.vim",
  callback = function()
    vim.cmd "source <afile>"
  end,
  group = general,
  desc = "Automatically source vim file whenever you save it",
})
