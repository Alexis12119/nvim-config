return {
  pickers = {
    oldfiles = {
      prompt_title = "Recent Files",
    },
  },
  extensions_list = { "themes", "terms", "fzf", "projects", "flutter" },
  defaults = {
    mappings = {
      i = {
        ["<Tab>"] = require("telescope.actions").move_selection_next,
        ["<S-Tab>"] = require("telescope.actions").move_selection_previous,
      },
    },
  },
}
