-- NOTE: Keymaps Popup/Guide
return {
  "folke/which-key.nvim",
  opts = {
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "", -- symbol prepended to a group
    },
  },
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "whichkey")
    require("which-key").setup(opts)
    require("which-key").register {
      {
        ["<leader>"] = {
          d = { name = "󰃤 Debugger" },
          r = { name = " Runner" },
          -- s = { name = "󰔚 Sessions" },
          f = { name = " Find" },
          g = { name = "󰊢 Git" },
          h = { name = " Harpoon" },
          l = { name = " LSP" },
          n = { name = " Neovim" },
          o = { name = " Options" },
          p = { name = " Plugins" },
          t = { name = " Terminal" },
          T = { name = "󰙨 Tests" },
          v = { name = " Venv" },
        },
      },
    }
  end,
}
