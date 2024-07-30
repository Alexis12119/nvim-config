---@type NvPluginSpec
return {
  "smjonas/inc-rename.nvim",
  enabled = false,
  cmd = {
    "IncRename",
  },
  init = function()
    vim.keymap.set("n", "<leader>lr", function()
      return ":IncRename " .. vim.fn.expand "<cword>"
    end, { desc = "IncRename | Rename", silent = true, expr = true })
  end,
  config = function()
    require("inc_rename").setup()
  end,
}
