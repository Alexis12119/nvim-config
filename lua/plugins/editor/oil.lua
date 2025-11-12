---@type LazySpec
-- NOTE: Buffer Explorer
return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  enabled = false,
  opts = {},
  init = function()
    vim.keymap.set("n", "<leader>O", function()
      if vim.bo.filetype == "oil" then
        Snacks.bufdelete()
      else
        vim.cmd("Oil")
      end
    end, { desc = "Toggle Oil" })
  end,
  lazy = false,
}
