vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.border_enabled = false -- NOTE: Toggle border for LSP Windows, nvim-cmp, lazy, which-key, mason
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

if vim.version().minor >= 11 then
  vim.tbl_add_reverse_lookup = function(tbl)
    for k, v in pairs(tbl) do
      tbl[v] = k
    end
  end
end

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.runtimepath:prepend(lazypath)

-- NOTE: lazy.nvim options
local lazy_config = require "core.lazy"

-- NOTE: Load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "clean",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- Load the highlights
require("base46").load_all_highlights()

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

require "myinit"
