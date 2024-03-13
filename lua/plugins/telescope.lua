-- NOTE: Fuzzy Finder
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      enabled = function()
        return vim.fn.executable "make" == 1
      end,
    },
  },
  opts = function(_, opts)
    local actions = require "telescope.actions"
    local trouble = require "trouble.providers.telescope"

    opts.pickers = {
      oldfiles = {
        prompt_title = "Recent Files",
      },
      find_files = {
        hidden = true,
      },
    }

    opts.defaults.path_display = { "smart" }
    opts.defaults.file_ignore_patterns = { "node_modules", ".git" }
    opts.extensions_list = { "themes", "terms", "fzf", "projects", "persisted", "harpoon" }

    opts.defaults.mappings.i = {
      ["<Tab>"] = actions.move_selection_next,
      ["<S-Tab>"] = actions.move_selection_previous,
      ["<C-j>"] = actions.toggle_selection + actions.move_selection_worse,
      ["<C-k>"] = actions.toggle_selection + actions.move_selection_better,
      ["<C-q>"] = trouble.open_with_trouble,
    }

    return opts
  end,
}
