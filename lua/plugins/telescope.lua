return {
  "nvim-telescope/telescope.nvim",
  module = true,
  cmd = "Telescope",
  dependencies = {
    {
      "dhruvmanila/browser-bookmarks.nvim",
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
