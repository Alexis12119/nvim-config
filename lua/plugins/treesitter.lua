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
    {
      "lukas-reineke/indent-blankline.nvim",
      enabled = false,
      config = function()
        local indent_blankline = require "indent_blankline"

        indent_blankline.setup {
          show_current_context = true,
          indent_blankline_char = "▏",
          indent_blankline_show_trailing_blankline_indent = false,
          indent_blankline_show_first_indent_level = true,
          indent_blankline_use_treesitter = true,
          indent_blankline_show_current_context = true,
          indent_blankline_buftype_exclude = { "terminal", "nofile" },
          indent_blankline_filetype_exclude = {
            "help",
            "NvimTree",
          },
        }
      end,
    },
  },
  build = ":TSUpdate",
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
