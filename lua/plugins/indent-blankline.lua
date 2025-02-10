---@type NvPluginSpec
-- NOTE: Show Indentlines
return {
  "lukas-reineke/indent-blankline.nvim",
  -- enabled = false,
  event = "VeryLazy",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    scope = {
      show_start = false,
    },
  },
}
