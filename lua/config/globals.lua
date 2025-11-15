-- NOTE: Global Variables

-- Colorscheme
-- Available themes: "tokyonight" and "nvchad"
-- github_dark_dimmed is a custom NvChad theme with extensive language highlighting
vim.g.colorscheme = "nvchad"

-- ====================================================================
-- Global Variables Configuration
-- These define environment-specific values and toggle certain Neovim behaviors.
-- ====================================================================

-- --------------------------------------------------------------------
-- Detect the current operating system
-- --------------------------------------------------------------------
local sysname = vim.uv.os_uname().sysname
-- Normalize OS name (returns "Windows", "Linux", "Darwin", etc.)
local os = sysname:match("Windows") and "Windows" or sysname:match("Linux") and "Linux" or sysname -- fallback to whatever system name was returned

-- Boolean convenience flag for platform checks
local is_windows = os == "Windows"

-- --------------------------------------------------------------------
-- Provider settings
-- --------------------------------------------------------------------

-- Disable language providers you don’t use to speed up startup time
-- These providers allow Neovim to run external languages inside the editor.
-- Setting them to 0 means they will not be loaded.
vim.g.loaded_node_provider = 0 -- Disable Node.js provider
vim.g.loaded_python3_provider = 0 -- Disable Python 3 provider
vim.g.loaded_perl_provider = 0 -- Disable Perl provider
vim.g.loaded_ruby_provider = 0 -- Disable Ruby provider

-- --------------------------------------------------------------------
-- UI and environment-specific globals
-- --------------------------------------------------------------------

-- Icon used to visually represent theme toggling in your UI
vim.g.toggle_theme_icon = "   "

-- Store OS information globally for easy access in other modules
vim.g.os = os
vim.g.is_windows = is_windows

-- Define OS-specific path delimiters and separators
-- Useful for dynamically constructing paths in plugin configs or scripts
vim.g.path_delimiter = is_windows and ";" or ":" -- Used for PATH-like variables
vim.g.path_separator = is_windows and "\\" or "/" -- Used for filesystem paths

-- Enable Inline Completion
vim.g.ai_cmp = false

-- Environment-specific settings
require("config.env")
