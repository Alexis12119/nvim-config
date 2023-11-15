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

conf.defaults.file_ignore_patterns = { "node_modules", ".git" }
conf.extensions_list = { "themes", "terms", "fzf", "projects" }

conf.defaults.mappings.i = {
  ["<Tab>"] = actions.move_selection_next,
  ["<S-Tab>"] = actions.move_selection_previous,
  ["<C-q>"] = trouble.open_with_trouble,
}

return conf
