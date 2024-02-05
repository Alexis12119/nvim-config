-- For switching between Python venv
return {
  "AckslD/swenv.nvim",
  init = function()
    require("core.utils").load_mappings "Swenv"
  end,
  ft = "python",
  opts = {},
}
