---@type NvPluginSpec
-- NOTE: Show Indentlines
return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = false,
  event = "BufReadPost",
  opts = {
    scope = {
      show_start = false,
    },
  },
  config = function(_, opts)
    require("ibl").setup(opts)
  end,
}
