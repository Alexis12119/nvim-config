return {
  "HiPhish/rainbow-delimiters.nvim",
  event = { "User FilePost" },
  init = function()
    dofile(vim.g.base46_cache .. "rainbowdelimiters")
  end,
}
