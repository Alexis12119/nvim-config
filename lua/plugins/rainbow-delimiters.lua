---@type NvPluginSpec
return {
  "HiPhish/rainbow-delimiters.nvim",
  event = "User FilePost",
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "rainbowdelimiters")
    require("rainbow-delimiters.setup").setup(opts)
  end,
}
