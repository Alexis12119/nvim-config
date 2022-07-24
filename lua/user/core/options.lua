local options = {
  backup = false, -- creates a backup file
  laststatus = 3, -- Global Statusline
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 1, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = false, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 8, -- pop up menu height
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = true, -- creates a swapfile
  timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 1000, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  scrolloff = 8, -- minimal number of columns to scroll horizontally.
  sidescrolloff = 8, -- minimal number of screen columns
  guifont = "Hack NF:h11:b", -- Set the font for GUI
  lazyredraw = true, -- Won't be redrawn while executing macros, register and other commands.
}

local global = {
  tokyonight_style = "night", -- Set theme for tokyonight
  tokyonight_italic_keywords = false, -- Disable italic on keywords  
  tokyonight_transparent_sidebar = true, -- Enable Transparent Sidebar
  do_filetype_lua = 1, -- use filetype.lua
  did_load_filetypes = 0, -- don't use filetype.vim
  highlighturl_enabled = true, -- highlight URLs by default
  zipPlugin = false, -- disable zip
  load_black = false, -- disable black
  loaded_2html_plugin = true, -- disable 2html
  loaded_getscript = true, -- disable getscript
  loaded_getscriptPlugin = true, -- disable getscript
  loaded_gzip = true, -- disable gzip
  loaded_logipat = true, -- disable logipat
  loaded_matchit = true, -- disable matchit
  loaded_netrwFileHandlers = true, -- disable netrw
  loaded_netrwPlugin = true, -- disable netrw
  loaded_netrwSettngs = true, -- disable netrw
  loaded_remote_plugins = true, -- disable remote plugins
  loaded_tar = true, -- disable tar
  loaded_tarPlugin = true, -- disable tar
  loaded_zip = true, -- disable zip
  loaded_zipPlugin = true, -- disable zip
  loaded_vimball = true, -- disable vimball
  loaded_vimballPlugin = true, -- disable vimball
  mapleader = " ", -- Set mapleader to space
  Illuminate_ftblacklist = {
    "alpha",
    "startuptime",
    "checkhealth",
    "help",
    "text",
    "yaml",
    "log",
    "NvimTree",
    "TelescopePrompt",
    "markdown",
    "packer",
    "Outline",
  }, -- Don't activate in these filetypes.
  symbols_outline = {
    auto_preview = false,
    highlight_hovered_item = false,
    width = 23,
    show_symbol_details = false,
    preview_bg_highlight = "Pmenu",
    keymaps = { -- These keymaps can be a string or a table for multiple keys
      close = { "<Esc>", "q" },
      goto_location = "<Cr>",
      focus_location = "o",
      hover_symbol = "<C-space>",
      toggle_preview = "K",
      rename_symbol = "r",
      code_actions = "a",
    },
    symbols = {
      File = { icon = "", hl = "TSURI" },
      Module = { icon = "", hl = "TSNamespace" },
      Namespace = { icon = "", hl = "TSNamespace" },
      Package = { icon = "", hl = "TSNamespace" },
      Class = { icon = "𝓒", hl = "TSType" },
      Method = { icon = "ƒ", hl = "TSMethod" },
      Property = { icon = "", hl = "TSMethod" },
      Field = { icon = "", hl = "TSField" },
      Constructor = { icon = "", hl = "TSConstructor" },
      Enum = { icon = "ℰ", hl = "TSType" },
      Interface = { icon = "ﰮ", hl = "TSType" },
      Function = { icon = "", hl = "TSFunction" },
      Variable = { icon = "", hl = "TSConstant" },
      Constant = { icon = "", hl = "TSConstant" },
      String = { icon = "𝓐", hl = "TSString" },
      Number = { icon = "#", hl = "TSNumber" },
      Boolean = { icon = "⊨", hl = "TSBoolean" },
      Array = { icon = "", hl = "TSConstant" },
      Object = { icon = "⦿", hl = "TSType" },
      Key = { icon = "🔐", hl = "TSType" },
      Null = { icon = "NULL", hl = "TSType" },
      EnumMember = { icon = "", hl = "TSField" },
      Struct = { icon = "𝓢", hl = "TSType" },
      Event = { icon = "🗲", hl = "TSType" },
      Operator = { icon = "+", hl = "TSOperator" },
      TypeParameter = { icon = "𝙏", hl = "TSParameter" },
    },
  },
}

vim.opt.shortmess:append "A" -- Disable asking when editing file with swapfile.
vim.opt.whichwrap:append "<,>,[,],h,l"
vim.opt.iskeyword:append "-"

for k, v in pairs(options) do
  vim.opt[k] = v
end
for k, v in pairs(global) do
  vim.g[k] = v
end
