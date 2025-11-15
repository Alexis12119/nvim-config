local statusline = require("config.statusline")

---@type LazySpec
-- NOTE: Statusline
return {
  {
    "nvim-lualine/lualine.nvim",
    enabled = vim.g.colorscheme ~= "nvchad",
    opts = function(_, opts)
      -- table.insert(opts.sections.lualine_x, { statusline.clients })
      table.insert(opts.sections.lualine_x, {
        function()
          local venv = statusline.python_venv()
          return venv ~= " " and venv or ""
        end,
      })
      opts.always_show_tabline = false
    end,
  },
}
