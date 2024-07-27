-- NOTE: Tmux navigation
local plugin = {
  "alexghergh/nvim-tmux-navigation",
  cond = vim.fn.executable "tmux" == 1,
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

if vim.env.TMUX ~= nil then
  plugin.event = "VeryLazy"
end

return plugin
