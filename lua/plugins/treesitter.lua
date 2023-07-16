return {
  "nvim-treesitter/nvim-treesitter",
  module = true,
  event = { "BufReadPost", "BufNewFile" },
  cmd = {
    "TSInstall",
    "TSInstallInfo",
    "TSUpdate",
    "TSBufEnable",
    "TSBufDisable",
    "TSEnable",
    "TSDisable",
    "TSModuleInfo",
  },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  -- build = ":TSUpdate",
  config = function()
    local configs = require "nvim-treesitter.configs"

    configs.setup {
      ensure_installed = {
        "c",
        "cpp",
        "vim",
        "lua",
        "go",
        "python",
        "java",
        "markdown",
        "markdown_inline",
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "tsx",
        "php",
        "json",
        "rust",
        "regex",
        "bash",
      }, -- one of "all" or a list of languages
      highlight = {
        enable = true, -- false will disable the whole extension
        disable = "", -- list of language that will be disabled
      },
      autopairs = {
        enable = true,
      },
      indent = { enable = false, disable = {} },
    }
  end,
}
