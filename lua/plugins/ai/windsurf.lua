---@type NvPluginSpec
-- NOTE: Windsurf
return {
  {
    "Exafunction/windsurf.nvim",
    enabled = false,
    event = {
      "BufReadPost",
      "BufNewFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup {}
    end,
  },
}
