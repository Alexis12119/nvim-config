-- Fuzzy Finder
return {
  "nvim-telescope/telescope.nvim",
  init = function()
    require("core.utils").load_mappings "Telescope"
  end,
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      enabled = function()
        return vim.fn.executable "make" == 1
      end,
    },
  },
  opts = function()
    local conf = require "plugins.configs.telescope"
    local actions = require "telescope.actions"
    local trouble = require "trouble.providers.telescope"

    conf.pickers = {
      oldfiles = {
        prompt_title = "Recent Files",
      },
      find_files = {
        hidden = true,
      },
    }

    conf.defaults.path_display = { "smart" }
    conf.defaults.file_ignore_patterns = { "node_modules", ".git" }
    conf.extensions_list = { "themes", "terms", "fzf", "projects", "persisted", "harpoon" }

    conf.defaults.mappings.i = {
      ["<Tab>"] = actions.move_selection_next,
      ["<S-Tab>"] = actions.move_selection_previous,
      ["<C-j>"] = actions.toggle_selection + actions.move_selection_worse,
      ["<C-k>"] = actions.toggle_selection + actions.move_selection_better,
      ["<C-q>"] = trouble.open_with_trouble,
    }

    return conf
  end,
}
