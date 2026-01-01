---@type LazySpec
-- NOTE: Buffer Explorer
return {
  "stevearc/oil.nvim",
  enabled = true,
  opts = {},
  keys = {
    {
      "<leader>O",
      function()
        if vim.bo.filetype == "oil" then
          Snacks.bufdelete()
        else
          vim.cmd("Oil")
        end
      end,
      desc = "Oil: Toggle Oil",
    },
  },
}
