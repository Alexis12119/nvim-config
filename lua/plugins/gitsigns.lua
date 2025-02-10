---@type NvPluginSpec
-- NOTE: Git Signs
return {
  "lewis6991/gitsigns.nvim",
  keys = {
    {
      "<leader>gp",
      "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
      desc = "Gitsigns | Preview Hunk",
      silent = true,
    },
    {
      "<leader>gj",
      "<cmd>lua require 'gitsigns'.next_hunk()<cr>",
      desc = "Gitsigns | Next Hunk",
      silent = true,
    },
    {
      "<leader>gk",
      "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",
      desc = "Gitsigns | Prev Hunk",
      silent = true,
    },
    {
      "<leader>gl",
      "<cmd>lua require 'gitsigns'.blame_line()<cr>",
      desc = "Gitsigns | Blame Line",
      silent = true,
    },
  },
  event = "VeryLazy",
  opts = {
    signs = {
      add = { text = "│" },
      change = { text = "│" },
      delete = { text = "󰍵" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "│" },
    },
    on_attach = function() end,
  },
}
