return {
  "akinsho/toggleterm.nvim",
  module = true,
  cmd = "ToggleTerm",
  opts = {
    size = 10,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = false,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    autochdir = true,
    highlights = {
      NormalFloat = {
        link = "Normal",
      },
      FloatBorder = {
        link = "FloatBorder",
      },
    },
    float_opts = {
      border = "rounded",
      winblend = 0,
    },
  },
}
