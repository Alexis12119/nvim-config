return {
  {
    "tpope/vim-dadbod",
    enabled = false,
    cmd = {
      "DB",
      "%DB",
    },
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    enabled = false,
    dependencies = {
      "tpope/vim-dadbod",
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
}
