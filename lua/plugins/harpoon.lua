-- NOTE: Marks
return {
  "ThePrimeagen/harpoon",
  init = function()
    vim.keymap.set("n", "<leader>ha", function()
      require("harpoon"):list():append()
      vim.notify("   Marked file", vim.log.levels.INFO, { title = "Harpoon" })
    end, { desc = "Add Mark" })

    vim.keymap.set("n", "<leader>hh", function()
      require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
    end, { desc = "Harpoon Menu" })

    -- Uncomment below to enable navigation keymaps
    -- vim.keymap.set("n", "<leader>hn", function()
    --   require("harpoon"):list():next()
    -- end, { desc = "Next" })

    -- vim.keymap.setmap("n", "<leader>hp", function()
    --   require("harpoon"):list():prev()
    -- end, { desc = "Previous" })
  end,
  branch = "harpoon2",
  opts = {},
}
