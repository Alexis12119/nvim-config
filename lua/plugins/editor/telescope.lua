local focus_preview = function(prompt_bufnr)
  local action_state = require("telescope.actions.state")
  local picker = action_state.get_current_picker(prompt_bufnr)
  local prompt_win = picker.prompt_win
  local previewer = picker.previewer
  local bufnr = previewer.state.bufnr or previewer.state.termopen_bufnr
  local winid = previewer.state.winid or vim.fn.win_findbuf(bufnr)[1]
  vim.keymap.set("n", "<A-p>", function()
    vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", prompt_win))
  end, { buffer = bufnr })
  vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", winid))
  -- api.nvim_set_current_win(winid)
end

---@type LazySpec
-- NOTE: Fuzzy Finder
return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      prompt_prefix = "   ",
      selection_caret = " ",
      entry_prefix = " ",
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
        },
        width = 0.87,
        height = 0.80,
      },
      extensions_list = { "themes", "terms", "fzf", "projects", "laravel", "undo", "persisted" },
      mappings = {
        i = {
          ["<Tab>"] = require("telescope.actions").move_selection_next,
          ["<S-Tab>"] = require("telescope.actions").move_selection_previous,
          ["<C-j>"] = require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_worse,
          ["<C-k>"] = require("telescope.actions").toggle_selection
            + require("telescope.actions").move_selection_better,
          ["<A-p>"] = focus_preview,
          ["<C-h>"] = require("telescope.actions.layout").toggle_preview,
          ["<C-q>"] = require("trouble.sources.telescope").open,
        },
      },
    },
    pickers = {
      oldfiles = {
        prompt_title = "Recent Files",
      },
      find_files = {
        hidden = true,
      },
    },
  },
}
