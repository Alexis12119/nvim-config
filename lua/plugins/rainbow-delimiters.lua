return {
  "HiPhish/rainbow-delimiters.nvim",
  event = { "BufReadPost", "BufNewFile" },
  init = function()
    dofile(vim.g.base46_cache .. "rainbowdelimiters")
  end,
}
