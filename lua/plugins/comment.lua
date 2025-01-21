---@type NvPluginSpec
-- NOTE: Commenter
return {
  "numToStr/Comment.nvim",
  cond = false,
  config = function()
    require("Comment").setup {
      -- ignores empty lines
      ignore = "^$",
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    }
  end,
  dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
}
