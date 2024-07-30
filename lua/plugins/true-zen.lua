---@type NvPluginSpec
return {
  {
    "pocco81/true-zen.nvim",
    enabled = false,
    init = function()
      vim.keymap.set("n", "<leader>za", "<cmd>TZAtaraxis<cr>", { desc = "TrueZen | Toggle Ataraxis", silent = true })
      vim.keymap.set(
        "n",
        "<leader>zm",
        "<cmd>TZMinimalist<cr>",
        { desc = "TrueZen | Toggle Minimalist", silent = true }
      )
      vim.keymap.set("n", "<leader>zn", "<cmd>TZNarrow<cr>", { desc = "TrueZen | Toggle Narrow", silent = true })
      vim.keymap.set("n", "<leader>zf", "<cmd>TZFocus<cr>", { desc = "TrueZen | Toggle Focus", silent = true })
      vim.keymap.set("v", "<leader>zn", "<cmd>'<,'>TZNarrow<cr>", { desc = "TrueZen | Toggle Narrow", silent = true })
    end,
    opts = {
      integrations = {
        tmux = false and vim.fn.has "win32" == 0,
        kitty = {
          enabled = false,
          font = "+3",
        },
        twilight = false,
        lualine = false,
      },
    },
  },
}
