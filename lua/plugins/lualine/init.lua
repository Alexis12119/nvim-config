return {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local theme = {
      normal = {
        a = { bg = "NONE", fg = "#7AA2F7" },
        b = { bg = "NONE", fg = "#BBC2CF" },
        c = { bg = "NONE", fg = "#BBC2CF" },
      },

      insert = {
        a = { bg = "NONE", fg = "#98BE65" },
        b = { bg = "NONE", fg = "#BBC2CF" },
      },

      command = {
        a = { bg = "NONE", fg = "#ECBE7B" },
        b = { bg = "NONE", fg = "#BBC2CF" },
      },

      visual = {
        a = { bg = "NONE", fg = "#C678DD" },
        b = { bg = "NONE", fg = "#BBC2CF" },
      },

      replace = {
        a = { bg = "NONE", fg = "#DB4B4B" },
        b = { bg = "NONE", fg = "#BBC2CF" },
      },

      terminal = {
        a = { bg = "NONE", fg = "#7AA2F7" },
        b = { bg = "NONE", fg = "#BBC2CF" },
      },

      inactive = {
        a = { bg = "NONE", fg = "#BBC2CF" },
        b = { bg = "NONE", fg = "#BBC2CF" },
        c = { bg = "NONE", fg = "#BBC2CF" },
      },
    }

    local lualine = require "lualine"

    local stl = require "plugins.lualine.components"

    lualine.setup {
      options = {
        globalstatus = true,
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        theme = theme,
        disabled_filetypes = {
          "dashboard",
          "lspinfo",
          "mason",
          "startuptime",
          "checkhealth",
          "help",
          "TelescopePrompt",
          "toggleterm",
          "alpha",
          "lazy",
        },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          stl.branch,
          stl.mode,
          stl.diagnostics,
          stl.lsp,
        },
        lualine_x = {
          stl.directory,
          stl.diff,
          stl.filetype,
          stl.filesize,
          stl.progress,
          stl.percent,
          stl.total_lines,
        },
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
}
