return {
  "olacin/telescope-gitmoji.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    {
      "<leader>gm",
      function()
        require("telescope").extensions.gitmoji.gitmoji()
      end,
      mode = "n",
      desc = "telescope gitmoji",
    },
  },
  config = function()
    require("telescope").load_extension "gitmoji"
  end,
}
