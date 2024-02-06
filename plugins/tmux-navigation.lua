-- Tmux navigation
return {
  "alexghergh/nvim-tmux-navigation",
  event = "VeryLazy",
  enabled = function()
    if vim.fn.has "win32" == 1 then
      return false
    end
    return true
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
