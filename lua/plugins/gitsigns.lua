---@type NvPluginSpec
-- NOTE: Git Signs
return {
  "lewis6991/gitsigns.nvim",
  keys = {
    {
      "<leader>gp",
      function()
        require("gitsigns").preview_hunk()
      end,
      desc = "Gitsigns | Preview Hunk",
      silent = true,
    },
    {
      "<leader>gj",
      function()
        require("gitsigns").nav_hunk "next"
      end,
      desc = "Gitsigns | Next Hunk",
      silent = true,
    },
    {
      "<leader>gk",
      function()
        require("gitsigns").nav_hunk "prev"
      end,
      desc = "Gitsigns | Prev Hunk",
      silent = true,
    },
    {
      "<leader>gl",
      function()
        require("gitsigns").blame_line()
      end,
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
