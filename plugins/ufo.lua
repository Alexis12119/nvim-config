-- NOTE: Improve Folds
return {
  "kevinhwang91/nvim-ufo",
  event = "User FilePost",
  init = function()
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.o.foldmethod = "indent"
  end,
  opts = {
    provider_selector = function(_, _, _)
      return { "treesitter", "indent" }
    end,
  },
  dependencies = {
    "kevinhwang91/promise-async",
    {
      "luukvbaal/statuscol.nvim",
      config = function()
        local builtin = require "statuscol.builtin"
        require("statuscol").setup {
          relculright = true,
          segments = {
            { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
            { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            { text = { "%s" }, click = "v:lua.ScSa" },
          },
        }
      end,
    },
  },
}
