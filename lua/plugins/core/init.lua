---@type NvPluginSpec
-- NOTE: Default Plugins
return {
  {
    "NvChad/nvterm",
    enabled = false,
  },
  {
    "nvzone/menu",
    init = function()
      vim.keymap.set("n", "<C-t>", function()
        require("menu").open "default"
      end, {})

      -- mouse users + nvimtree users!
      vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
        require("menu.utils").delete_old_menus()

        vim.cmd.exec '"normal! \\<RightMouse>"'

        -- clicked buf
        local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
        local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

        require("menu").open(options, { mouse = true })
      end, {})
    end,
  },
  {
    "nvzone/showkeys",
    init = function()
      vim.keymap.set(
        "n",
        "<leader>ok",
        "<cmd>ShowkeysToggle<cr>",
        { desc = "Screenkey | Toggle Screenkey", silent = true }
      )
    end,
    cmd = "ShowkeysToggle",
  },
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },
}
