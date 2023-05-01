return {
  "nvim-telescope/telescope.nvim",
  -- module = true,
  -- cmd = "Telescope",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
    },
    {
      "dhruvmanila/browser-bookmarks.nvim",
    },
    {
      "ahmedkhalf/project.nvim",
      config = function()
        require("project_nvim").setup {
          -- Manual mode doesn't automatically change your root directory, so you have
          -- the option to manually do so using `:ProjectRoot` command.
          manual_mode = false,

          -- Methods of detecting the root directory. **"lsp"** uses the native neovim
          -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
          -- order matters: if one is not detected, the other is used as fallback. You
          -- can also delete or rearangne the detection methods.
          detection_methods = { "pattern", "lsp" },

          -- All the patterns used to detect root dir, when **"pattern"** is in
          -- detection_methods
          patterns = { ".git", ".svn", "Makefile", "package.json" },

          -- Table of lsp clients to ignore by name
          -- eg: { "efm", ... }
          ignore_lsp = {},

          -- Don't calculate root dir on specific directories
          -- Ex: { "~/.cargo/*", ... }
          exclude_dirs = {},

          -- Show hidden files in telescope
          show_hidden = false,

          -- When set to false, you will get a message when project.nvim changes your
          -- directory.
          silent_chdir = true,

          -- What scope to change the directory, valid options are
          -- * global (default)
          -- * tab
          -- * win
          scope_chdir = "global",

          -- Path where project.nvim will store the project history for use in
          -- telescope
          datapath = vim.fn.stdpath "data",
        }
      end,
    },
  },
  config = function()
    local telescope = require "telescope"

    local actions = require "telescope.actions"

    local pickers = {
      oldfiles = {
        prompt_title = "Recent Files",
      },
    }

    local extensions = {
      bookmarks = {
        url_open_command = "brave",
      },
    }

    telescope.setup {
      defaults = {
        layout_config = {
          width = 0.8,
          prompt_position = "top",
          preview_cutoff = 120,
          horizontal = { mirror = false },
          vertical = { mirror = false },
        },
        layout_strategy = "horizontal",
        winblend = 0,
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        prompt_prefix = "   ",
        selection_caret = "ﰲ ",
        path_display = { "smart" },
        file_ignore_patterns = { ".git/", "node_modules" },
        mappings = {
          i = {
            ["<A-j>"] = actions.move_selection_next,
            ["<A-k>"] = actions.move_selection_previous,
            ["<Tab>"] = actions.move_selection_next,
            ["<S-Tab>"] = actions.move_selection_previous,
          },
          n = {
            [";"] = actions.close,
          },
        },
      },
      pickers = pickers,
      extensions = extensions,
    }

    telescope.load_extension "bookmarks"
    telescope.load_extension "projects"
  end,
}
