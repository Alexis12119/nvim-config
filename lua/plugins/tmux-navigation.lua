-- NOTE: Tmux navigation
return {
  "alexghergh/nvim-tmux-navigation",
  event = "VeryLazy",
  enabled = function()
    return vim.fn.has "win32" == 0
  end,
  opts = {
    keybindings = {
      left = "<C-h>",
      down = "<C-j>",
      up = "<C-k>",
      right = "<C-l>",
      last_active = "<C-\\>",
      next = "<C-Space>",
    },
  },
}
