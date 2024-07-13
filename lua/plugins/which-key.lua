-- NOTE: Keymaps Popup/Guide
return {
  "folke/which-key.nvim",
  opts = {
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "", -- symbol prepended to a group
    },
    delay = 0,
  },
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "whichkey")
    require("which-key").setup(opts)
    require("which-key").add {
      {
        { "<leader>T", group = "󰙨 Tests" },
        { "<leader>d", group = "Debugging" },
        { "<leader>f", group = " Find" },
        { "<leader>g", group = "Git" },
        { "<leader>h", group = " Harpoon" },
        { "<leader>l", group = " LSP" },
        { "<leader>n", group = " Neovim" },
        { "<leader>o", group = " Options" },
        { "<leader>p", group = " Plugins" },
        { "<leader>r", group = " Runner" },
        { "<leader>t", group = "Terminal" },
        { "<leader>v", group = " Venv" },
      },
    }
  end,
  keys = {
    "[",
    "]",
  },
}
