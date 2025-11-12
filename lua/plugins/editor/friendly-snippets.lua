---@type LazySpec
-- NOTE: Pre-Define Snippets
return {
  "rafamadriz/friendly-snippets",
  event = "InsertEnter",
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_snipmate").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets/snipmate" } })
    -- require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets/vscode" } })
  end,
}
