function _G.ReloadConfig()
  for name, _ in pairs(package.loaded) do
    if name:match "^cnull" then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
end

function _G.check_back_space()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- General Settings
local general = augroup("General Settings", { clear = true })

-- Disable Bufferline in Alpha
autocmd("User", {
  pattern = "AlphaReady",
  command = "set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2",
})

-- Disable Lualine in Alpha
autocmd("User", {
  pattern = "AlphaReady",
  command = "set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3",
})

autocmd("BufWritePre", {
  pattern = "init.lua",
  callback = ReloadConfig,
  group = general,
})

autocmd("BufReadPost", {
  command = [[ if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif ]],
  group = general,
})

autocmd("TextYankPost", {
  command = "silent! lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})",
  group = general,
})

autocmd("FocusGained", {
  command = "checktime",
  group = general,
})

autocmd({ "BufEnter", "BufWinEnter" }, {
  command = "set formatoptions-=cro | lcd %:p:h",
  group = general,
})

autocmd("FileType", {
  pattern = { "c", "cpp", "py", "java", "cs" },
  command = "setlocal sw=4",
  group = general,
})

autocmd("FileType", {
  pattern = { "gd" },
  command = "setlocal ft=gdscript",
  group = general,
})

autocmd({ "TextChanged", "TextChangedI" }, {
  command = "silent! w",
  group = general,
})

--Auto Resize
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
  group = general,
})

-- Git
local git = augroup("Git", { clear = true })

autocmd("FileType", {
  pattern = "gitcommit",
  command = "setlocal wrap | setlocal spell",
  group = git,
})

-- Markdown
local markdown = augroup("Markdown", { clear = true })

autocmd("FileType", {
  pattern = "markdown",
  command = "setlocal wrap | setlocal spell",
  group = markdown,
})
