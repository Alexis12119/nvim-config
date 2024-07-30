---@type NvPluginSpec
-- NOTE: Tmux navigation
return {
  "alexghergh/nvim-tmux-navigation",
  cond = vim.fn.executable "tmux" == 1,
  event = vim.env.TMUX ~= nil and "VeryLazy" or nil,
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
