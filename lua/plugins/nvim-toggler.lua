return {
  "nguyenvukhang/nvim-toggler",
  keys = { "<leader>i" },
  opts = { remove_default_keybinds = false },
  config = function(_, opts)
    require("nvim-toggler").setup(opts)
  end,
}
