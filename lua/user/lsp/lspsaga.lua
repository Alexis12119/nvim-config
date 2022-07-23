local status_ok, saga = pcall(require, "saga")
if not status_ok then
  return
end

saga.init_lsp_saga {
  -- "single" | "double" | "rounded" | "bold" | "plus"
  border_style = "rounded",
  -- Error, Warn, Info, Hint
  diagnostic_header = { " ", " ", " ", "" },
  -- same as nvim-lightbulb but async
  code_action_lightbulb = {
    enable = false,
  },
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    tabe = "t",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>", -- quit can be a table
  },
  definition_preview_icon = "  ",
}
