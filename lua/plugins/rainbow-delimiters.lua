return {
  "HiPhish/rainbow-delimiters.nvim",
  event = "BufReadPost",
  init = function()
    dofile(vim.g.base46_cache .. "rainbowdelimiters")
  end,
}
