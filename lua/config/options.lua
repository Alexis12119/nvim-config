-- NOTE: Neovim Options

-- ====================================================================
-- Neovim Options Configuration
-- These settings are applied before lazy.nvim starts up.
-- Reference (LazyVim defaults): https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- ====================================================================

-- Show a global statusline instead of one per window
vim.o.laststatus = 3

-- Disable creation of backup files (e.g., file~)
vim.o.backup = false

-- Show all text, even concealed syntax (e.g., Markdown links)
vim.o.conceallevel = 0

-- Default file encoding for new and opened files
vim.o.fileencoding = "utf-8"

-- Allow hidden buffers (unsaved changes won’t block switching)
vim.o.hidden = true

-- Ignore case when searching (use smartcase for sensitivity)
vim.o.ignorecase = true

-- Enable mouse support in all modes (a = normal, insert, visual, etc.)
vim.o.mouse = "a"

-- Set popup menu (completion) height and transparency
vim.o.pumheight = 8
vim.o.pumblend = 0

-- Hide mode text ("-- INSERT --") since the statusline shows it
vim.o.showmode = false

-- Case-insensitive search unless uppercase letters are used
vim.o.smartcase = true

-- Enable smart indentation when starting a new line
vim.o.smartindent = true

-- Open horizontal splits below the current window
vim.o.splitbelow = true

-- Open vertical splits to the right of the current window
vim.o.splitright = true

-- Keep text layout stable when splitting (preserves scroll position)
vim.o.splitkeep = "screen"

-- Enable swap files for recovery (set to false to disable)
vim.o.swapfile = true

-- Reduce mapped key timeout (affects which-key responsiveness)
vim.o.timeoutlen = 500

-- Save undo history to disk for persistent undo between sessions
vim.o.undofile = true

-- Faster CursorHold and LSP feedback
vim.o.updatetime = 100

-- Prevent overwriting a file being edited by another process
vim.o.writebackup = false

-- Convert tabs to spaces automatically
vim.o.expandtab = true

-- Number of spaces per indentation level
vim.o.shiftwidth = 2

-- Number of spaces represented by a <Tab>
vim.o.tabstop = 2

-- Highlight the line under the cursor
vim.o.cursorline = true

-- Show absolute line numbers
vim.o.number = true

-- Show relative numbers (useful for motions like 5j, 3k)
vim.o.relativenumber = true

-- Set line number column width
vim.o.numberwidth = 5

-- Always show the sign column (for LSP, Git, etc.)
vim.o.signcolumn = "yes"

-- Disable line wrapping
vim.o.wrap = false

-- Disable lazy redraw for smoother animations (set to true for macros)
vim.o.lazyredraw = false

-- Enable full 24-bit color support in the terminal
vim.o.termguicolors = true

-- Disable the old ruler (line/column display)
vim.o.ruler = false

-- Set command line height (0 = auto-hide, reduces UI clutter)
vim.o.cmdheight = 0

-- Set help window height
vim.o.helpheight = 10

-- Specify what’s saved in a session
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- ====================================================================
-- Extended options
-- ====================================================================

-- Customize fill characters (UI symbols for folds, end of buffer, etc.)
vim.opt.fillchars = {
  eob = " ", -- Empty line at the end of buffer
  fold = " ", -- Fill character for folded text
  foldopen = "", -- Icon for open fold
  foldsep = " ", -- Separator between folds
  foldclose = "", -- Icon for closed fold
  lastline = " ", -- Avoid ~ at the end of files
}

-- Append to 'shortmess' to reduce command line noise
-- 'A' = don't show swapfile messages, 'c' = suppress completion messages
vim.opt.shortmess:append("Ac")

-- Allow cursor to move freely between lines in Normal mode
vim.opt.whichwrap:append("<>[]hl")

-- Treat hyphenated words as a single word (for motions like 'w' and 'b')
vim.opt.iskeyword:append("-")

require("config.globals")
