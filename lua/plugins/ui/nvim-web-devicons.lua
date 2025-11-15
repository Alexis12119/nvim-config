return {
  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      dofile(vim.g.base46_cache .. "devicons")
    end,
  },
  { "nvim-mini/mini.icons", version = "*", enabled = false },
}
