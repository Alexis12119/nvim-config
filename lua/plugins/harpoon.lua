---@type NvPluginSpec
-- NOTE: Marks
return {
  "ThePrimeagen/harpoon",
  keys = {
    {
      "<leader>ha",
      function()
        require("harpoon"):list():add()
        vim.notify("   Marked file", vim.log.levels.INFO, { title = "Harpoon" })
      end,
      desc = "Harpoon | Add Mark",
    },
    {
      "<leader>hh",
      function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
      end,
      desc = "Harpoon | Menu",
    },
    -- Uncomment below to enable navigation keymaps
    {
      "<leader>hn",
      function()
        require("harpoon"):list():next()
      end,
      desc = "Harpoon | Next",
    },
    {
      "<leader>hp",
      function()
        require("harpoon"):list():prev()
      end,
      desc = "Harpoon | Previous",
    },
  },
  branch = "harpoon2",
  opts = {},
}
