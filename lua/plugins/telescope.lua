return {
  "nvim-telescope/telescope.nvim",
  module = true,
  cmd = "Telescope",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
    },
    {
      "olimorris/persisted.nvim",
      cmd = {
        "SessionSave",
        "SessionToggle",
        "SessionDelete",
        "SessionLoad",
        "SessionLoadLast",
        "SessionLoadFromFile",
        "SessionStart",
        "SessionStop",
      },
      config = function()
        require("persisted").setup {
          save_dir = vim.fn.expand(vim.fn.stdpath "data" .. "/sessions/"), -- directory where session files are saved
          silent = false, -- silent nvim message when sourcing session file
          use_git_branch = false, -- create session files based on the branch of the git enabled repository
          autosave = false, -- automatically save session files when exiting Neovim
          should_autosave = nil, -- function to determine if a session should be autosaved
          autoload = false, -- automatically load the session for the cwd on Neovim startup
          on_autoload_no_session = nil, -- function to run when `autoload = true` but there is no session to load
          follow_cwd = true, -- change session file name to match current working directory if it changes
          allowed_dirs = nil, -- table of dirs that the plugin will auto-save and auto-load from
          ignored_dirs = nil, -- table of dirs that are ignored when auto-saving and auto-loading
          telescope = { -- options for the telescope extension
            reset_prompt_after_deletion = true, -- whether to reset prompt after session deleted
          },
        }
      end,
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      enabled = false,
      build = ":make",
    },
    { "dhruvmanila/browser-bookmarks.nvim" },
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
      -- fzf = {
      --   fuzzy = true, -- false will only do exact matching
      --   override_generic_sorter = true, -- override the generic sorter
      --   override_file_sorter = true, -- override the file sorter
      --   case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      --   -- the default case_mode is "smart_case"
      -- },
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

    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    -- telescope.load_extension "fzf"
    telescope.load_extension "bookmarks"
    telescope.load_extension "persisted"
  end,
}
