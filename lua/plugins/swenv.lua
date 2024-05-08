-- NOTE: For switching between Python venv
return {
  "AckslD/swenv.nvim",
  init = function()
    vim.keymap.set("n", "<leader>vp", "<cmd>lua=require('swenv.api').pick_venv()<cr>", { desc = "Swenv | Pick Python venv" })
  end,
  ft = "python",
  opts = {},
}
