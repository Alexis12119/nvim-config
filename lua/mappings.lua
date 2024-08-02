-- NOTE: NvChad Related Mappings
local fn = vim.fn
local cwd = vim.fn.stdpath "config" .. "/"
local config_dir = { cwd }

-- local get_nvim_tree_buf_id = function()
--   local windows = vim.api.nvim_list_wins()
--   for _, win in ipairs(windows) do
--     local buf = vim.api.nvim_win_get_buf(win)
--     local name = vim.api.nvim_buf_get_name(buf)
--     if string.find(name, "NvimTree") then
--       return buf
--     end
--   end
--   return ""
-- end

local delete_buffer = function(buf)
  local cmd = buf and "Bdelete! " .. buf or "Bdelete!"
  if vim.bo.modified then
    local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
    if choice == 1 then -- Yes
      vim.cmd.write()
      vim.cmd(cmd)
    elseif choice == 2 then -- No
      vim.cmd(cmd)
    end
  else -- No changes
    vim.cmd(cmd)
  end
end

-- Remove All Text
vim.keymap.set("n", "<leader>D", "<cmd>%d+<cr>", { desc = "General | Remove All Text", silent = true })

-- Yank All Text
vim.keymap.set("n", "<leader>y", "<cmd>%y+<cr>", { desc = "General | Yank All Text", silent = true })

-- Quit
vim.keymap.set("n", "<leader>q", "<cmd>qa!<cr>", { desc = "General | Quit", silent = true })

-- Toggle Tabufline
vim.keymap.set("n", "<leader>ob", function()
  if vim.o.showtabline == 2 then
    vim.o.showtabline = 0
    vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Tabufline" })
  else
    vim.o.showtabline = 2
    vim.notify("Toggled On", vim.log.levels.INFO, { title = "Tabufline" })
  end
end, { desc = "Options | Toggle Tabufline", silent = true })

-- Toggle Statusline
vim.keymap.set("n", "<leader>os", function()
  if vim.o.laststatus == 3 then
    vim.o.laststatus = 0
    vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Statusline" })
  else
    vim.o.laststatus = 3
    vim.notify("Toggled On", vim.log.levels.INFO, { title = "Statusline" })
  end
end, { desc = "Options | Toggle Statusline", silent = true })

-- Toggle Line Number
vim.keymap.set("n", "<leader>ol", function()
  vim.o.number = not vim.o.number
  if vim.o.number then
    vim.notify("Toggled On", vim.log.levels.INFO, { title = "Line Number" })
  else
    vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Line Number" })
  end
end, { desc = "Options | Toggle Line Number", silent = true })

-- Toggle Relative Number
vim.keymap.set("n", "<leader>or", function()
  vim.o.relativenumber = not vim.o.relativenumber
  if vim.o.relativenumber then
    vim.notify("Toggled On", vim.log.levels.INFO, { title = "Relative Number" })
  else
    vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Relative Number" })
  end
end, { desc = "Options | Toggle Relative Number", silent = true })

vim.keymap.set("n", "<leader>oS", function()
  vim.wo.spell = not vim.wo.spell
  if vim.wo.spell then
    vim.notify("Toggled On", vim.log.levels.INFO, { title = "Spell Check" })
  else
    vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Spell Check" })
  end
end, { desc = "Options | Toggle Spell Check", silent = true })

-- Toggle Theme
vim.keymap.set("n", "<leader>ot", function()
  vim.g.switch_theme = not vim.g.switch_theme
  require("base46").toggle_theme()
  if vim.g.switch_theme then
    vim.notify("Light Mode", vim.log.levels.INFO, { title = "Theme" })
  else
    vim.notify("Dark Mode", vim.log.levels.INFO, { title = "Theme" })
  end
end, { desc = "Options | Toggle Theme", silent = true })

-- Toggle Transparency
vim.keymap.set("n", "<leader>oT", function()
  vim.g.transparency_enabled = not vim.g.transparency_enabled
  require("base46").toggle_transparency()
  if vim.g.transparency_enabled then
    vim.notify("Toggled On", vim.log.levels.INFO, { title = "Transparency" })
  else
    vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Transparency" })
  end
end, { desc = "Options | Toggle Transparency", silent = true })

-- Toggle Wrap
vim.keymap.set("n", "<leader>ow", function()
  vim.o.wrap = not vim.o.wrap
  if vim.o.wrap then
    vim.notify("Toggled On", vim.log.levels.INFO, { title = "Line Wrap" })
  else
    vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Line Wrap" })
  end
end, { desc = "Options | Toggle Wrap", silent = true })

-- Better Down
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { desc = "General | Better Down", expr = true, silent = true })

-- Better Up
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { desc = "General | Better Up", expr = true, silent = true })

-- Go to upper window
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "General | Go to upper window", silent = true })

-- Go to lower window
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "General | Go to lower window", silent = true })

-- Go to left window
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "General | Go to left window", silent = true })

-- Go to right window
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "General | Go to right window", silent = true })

-- Close window
vim.keymap.set("n", "<leader>w", function()
  if vim.bo.buftype == "terminal" then
    vim.cmd "Bdelete!"
    vim.cmd "silent! close"
  elseif #vim.api.nvim_list_wins() > 1 then
    vim.cmd "silent! close"
  else
    vim.notify("Can't Close Window", vim.log.levels.WARN, { title = "Close Window" })
  end
end, { desc = "General | Close window", silent = true })

-- Add size at the top
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "General | Add size at the top", silent = true })

-- Add size at the bottom
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "General | Add size at the bottom", silent = true })

-- Add size at the left
vim.keymap.set(
  "n",
  "<C-Right>",
  "<cmd>vertical resize +2<CR>",
  { desc = "General | Add size at the left", silent = true }
)

-- Add size at the right
vim.keymap.set(
  "n",
  "<C-Left>",
  "<cmd>vertical resize -2<CR>",
  { desc = "General | Add size at the right", silent = true }
)

-- Go to previous buffer
vim.keymap.set("n", "H", function()
  require("nvchad.tabufline").prev()
end, { desc = "General | Go to previous buffer", silent = true })

-- Go to next buffer
vim.keymap.set("n", "L", function()
  require("nvchad.tabufline").next()
end, { desc = "General | Go to next buffer", silent = true })

-- Close Buffer
vim.keymap.set("n", "<leader>c", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "General | Close Buffer", silent = true })

-- Close Other Buffers
vim.keymap.set("n", "<leader>C", function()
  local bufs = vim.api.nvim_list_bufs()
  local current_buf = vim.api.nvim_get_current_buf()
  for _, i in ipairs(bufs) do
    if i ~= current_buf then
      vim.api.nvim_buf_delete(i, {})
    end
  end
end, { desc = "General | Close Other Buffers", silent = true })

-- Close buffers from Left
vim.keymap.set("n", "scl", function()
  require("nvchad.tabufline").closeBufs_at_direction "left"
end, { desc = "General | Close Buffers from Left", silent = true })

-- Close buffers from Right
vim.keymap.set("n", "scr", function()
  require("nvchad.tabufline").closeBufs_at_direction "right"
end, { desc = "General | Close Buffers from Right", silent = true })

-- Go to previous tab
vim.keymap.set("n", "<Left>", "<cmd>tabprevious<CR>", { desc = "General | Go to previous tab", silent = true })

-- Go to next tab
vim.keymap.set("n", "<Right>", "<cmd>tabnext<CR>", { desc = "General | Go to next tab", silent = true })

-- New tab
vim.keymap.set("n", "<Up>", "<cmd>tabnew<CR>", { desc = "General | New tab", silent = true })

-- Close tab
vim.keymap.set("n", "<Down>", "<cmd>tabclose<CR>", { desc = "General | Close tab", silent = true })

-- Indent backward
-- vim.keymap.set("n", "<", "<<", { desc = "General | Indent backward", silent = true })

-- Indent forward
-- vim.keymap.set("n", ">", ">>", { desc = "General | Indent forward", silent = true })

-- Move the line up
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "General | Move the line up", silent = true })

-- Move the line down
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "General | Move the line down", silent = true })

-- Move the line up (Insert Mode)
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "General | Move the line up", silent = true })

-- Move the line down (Insert Mode)
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "General | Move the line down", silent = true })

-- Move selected lines up (Visual Mode)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "General | Move selected lines up", silent = true })

-- Move selected lines down (Visual Mode)
vim.keymap.set("i", "<A-j>", ":m '<-2<CR>gv=gv", { desc = "General | Move selecte lines down", silent = true })

-- Better Down (Visual Mode)
vim.keymap.set("v", "j", "v:count == 0 ? 'gj' : 'j'", { desc = "General | Better Down", expr = true, silent = true })

-- Better Up (Visual Mode)
vim.keymap.set("v", "k", "v:count == 0 ? 'gk' : 'k'", { desc = "General | Better Up", expr = true, silent = true })

-- Better Paste (Visual Mode)
vim.keymap.set("v", "p", '"_dP', { desc = "General | Better Paste", silent = true })

-- Indent backward (Visual Mode)
vim.keymap.set("v", "<", "<gv", { desc = "General | Indent backward", silent = true })

-- Indent forward (Visual Mode)
vim.keymap.set("v", ">", ">gv", { desc = "General | Indent forward", silent = true })

-- Move the selected text up (Visual Mode)
vim.keymap.set("v", "<A-j>", "<cmd>m '>+1<CR>gv=gv", { desc = "General | Move the selected text up", silent = true })

-- Move the selected text down (Visual Mode)
vim.keymap.set("v", "<A-k>", "<cmd>m '<-2<CR>gv=gv", { desc = "General | Move the selected text down", silent = true })

-- Enter Insert Mode Terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Enter Insert Mode", silent = true })

-- Word Search Increment
vim.keymap.set("c", "<Tab>", function()
  if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
    return "<CR>/<C-r>/"
  end
  return "<C-z>"
end, { desc = "General | Word Search Increment", expr = true })

-- Word Search Decrement
vim.keymap.set("c", "<S-Tab>", function()
  if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
    return "<CR>?<C-r>/"
  end
  return "<S-Tab>"
end, { desc = "General | Word Search Decrement", expr = true })

-- Disable Default "s" Keymap In Neovim and Replace with custom Windows & TS Swap
vim.keymap.set("n", "s", "<nop>", { desc = "Windows & TS Swap", silent = true, remap = true })

-- Find Config Files
vim.keymap.set("n", "<leader>nf", function()
  require("telescope.builtin").find_files {
    prompt_title = "Config Files",
    search_dirs = config_dir,
    cwd = cwd,
  }
end, { desc = "Neovim | Find Config Files", silent = true })

-- Grep Config Files
vim.keymap.set("n", "<leader>ng", function()
  require("telescope.builtin").live_grep {
    prompt_title = "Config Files",
    search_dirs = config_dir,
    cwd = cwd,
  }
end, { desc = "Neovim | Grep Config Files", silent = true })

-- Quick go to row and column
vim.keymap.set("n", "<leader>nG", function()
  vim.ui.input({ prompt = "Enter line number" }, function(row)
    row = row ~= "" and row or 0
    vim.ui.input({ prompt = "Enter char number" }, function(col)
      col = col ~= "" and col or 0
      vim.cmd("call cursor(" .. row .. ", " .. col .. ")")
    end)
  end)
end, { desc = "Neovim | Goto Row & Col", silent = true })

-- Toggle Cheatsheet
vim.keymap.set("n", "<leader>nc", function()
  if vim.bo.filetype == "nvcheatsheet" then
    vim.cmd "silent! close"
  else
    vim.cmd "NvCheatsheet"
  end
end, { desc = "Neovim | Toggle Cheatsheet", silent = true })

-- Inspect
vim.keymap.set("n", "<leader>ni", function()
  if vim.fn.has "nvim-0.9.0" == 1 then
    vim.cmd "Inspect"
  else
    vim.notify("Inspect isn't available in this neovim version", vim.log.levels.WARN, { title = "Inspect" })
  end
end, { desc = "Neovim | Inspect", silent = true }) -- only available on neovim >= 0.9

-- Messages
vim.keymap.set("n", "<leader>nm", "<cmd>messages<cr>", { desc = "Neovim | Messages", silent = true })

-- Health
vim.keymap.set("n", "<leader>nh", "<cmd>checkhealth<cr>", { desc = "Neovim | Health", silent = true })

-- Version
vim.keymap.set("n", "<leader>nv", function()
  local version = vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
  return vim.notify(version, vim.log.levels.INFO, { title = "Neovim Version" })
end, { desc = "Neovim | Version", silent = true })

-- Run Code
vim.keymap.set("n", "<leader>nr", function()
  RunCode()
end, { desc = "Neovim | Run Code", silent = true })

vim.keymap.set("n", "<leader>np", function()
  print(vim.api.nvim_buf_get_name(0))
end, { desc = "Neovim | Get Current File Path", silent = true })

-- Clean
vim.keymap.set("n", "<leader>pc", "<cmd>Lazy clean<cr>", { desc = "Lazy | Clean", silent = true })

-- Check
vim.keymap.set("n", "<leader>pC", "<cmd>Lazy check<cr>", { desc = "Lazy | Check", silent = true })

-- Debug
vim.keymap.set("n", "<leader>pd", "<cmd>Lazy debug<cr>", { desc = "Lazy | Debug", silent = true })

-- Install
vim.keymap.set("n", "<leader>pi", "<cmd>Lazy install<cr>", { desc = "Lazy | Install", silent = true })

-- Sync
vim.keymap.set("n", "<leader>ps", "<cmd>Lazy sync<cr>", { desc = "Lazy | Sync", silent = true })

-- Log
vim.keymap.set("n", "<leader>pl", "<cmd>Lazy log<cr>", { desc = "Lazy | Log", silent = true })

-- Home
vim.keymap.set("n", "<leader>ph", "<cmd>Lazy home<cr>", { desc = "Lazy | Home", silent = true })

-- Help
vim.keymap.set("n", "<leader>pH", "<cmd>Lazy help<cr>", { desc = "Lazy | Help", silent = true })

-- Profile
vim.keymap.set("n", "<leader>pp", "<cmd>Lazy profile<cr>", { desc = "Lazy | Profile", silent = true })

-- Update
vim.keymap.set("n", "<leader>pu", "<cmd>Lazy update<cr>", { desc = "Lazy | Update", silent = true })

-- Escape
vim.keymap.set("i", "jk", "<Esc>", { desc = "General | Enter Normal Mode", silent = true })

-- Split Window
vim.keymap.set("n", "ss", "<cmd>split<cr>", { desc = "General | Split Horizontal", silent = true })
vim.keymap.set("n", "sv", "<cmd>vsplit<cr>", { desc = "General | Split Vertical", silent = true })

-- Close Current Window
vim.keymap.set("n", "sq", "<cmd>close<cr>", { desc = "General | Close Current Windows", silent = true })

-- Move window
vim.keymap.set("n", "sh", "<C-w>H", { desc = "General | Move Window to Far Left", silent = true })
vim.keymap.set("n", "sj", "<C-w>J", { desc = "General | Move Window to Far Down", silent = true })
vim.keymap.set("n", "sk", "<C-w>K", { desc = "General | Move Window to Far Up", silent = true })
vim.keymap.set("n", "sl", "<C-w>L", { desc = "General | Move Window to Far Right", silent = true })
vim.keymap.set("n", "sr", "<C-w>r", { desc = "General | Rotate Window Down/Right", silent = true })
vim.keymap.set("n", "sR", "<C-w>R", { desc = "General | Rotate Window Up/Left", silent = true })

-- Close other windows
vim.keymap.set("n", "<leader>W", "<cmd>only<cr>", { desc = "General | Close Other Windows", silent = true })

-- Save
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>", { desc = "General | Save", silent = true })

-- Clear Search Highlight
vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>", { desc = "General | Clear Search Highlight", silent = true })

-- Select All
vim.keymap.set("n", "<leader>A", "ggVG", { desc = "General | Select All", silent = true })
