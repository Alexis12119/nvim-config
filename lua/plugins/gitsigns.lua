---@type NvPluginSpec
-- NOTE: Git Signs
return {
  "lewis6991/gitsigns.nvim",
  init = function()
    vim.keymap.set(
      "n",
      "<leader>gp",
      "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
      { desc = "Gitsigns | Preview Hunk", silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>gj",
      "<cmd>lua require 'gitsigns'.next_hunk()<cr>",
      { desc = "Gitsigns | Next Hunk", silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>gk",
      "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",
      { desc = "Gitsigns | Prev Hunk", silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>gl",
      "<cmd>lua require 'gitsigns'.blame_line()<cr>",
      { desc = "Gitsigns | Blame Line", silent = true }
    )
  end,
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
