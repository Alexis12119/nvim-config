-- NOTE: Completion Engine

return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  init = function()
    vim.keymap.set("n", "<leader>oa", function()
      vim.g.toggle_cmp = not vim.g.toggle_cmp
      if vim.g.toggle_cmp then
        vim.notify("Toggled On", vim.log.levels.INFO, { title = "Autocomplete" })
      else
        vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Autocomplete" })
      end
    end, { desc = "Options | Toggle Autocomplete" })
  end,
  config = function(_, opts)
    -- table.insert(opts.sources, 2, { name = "codeium" })
    -- table.insert(opts.sources, 1, { name = "supermaven" })

    opts.mapping = vim.tbl_extend("force", {}, opts.mapping, {
      -- You can add here new mappings.
    })

    opts.completion["completeopt"] = "menu,menuone,noselect" -- disable autoselect

    opts.enabled = function()
      return (vim.g.toggle_cmp and vim.bo.buftype == "")
    end

    local icons = require "nvchad.icons.lspkind"

    opts.formatting = {
      format = function(entry, vim_item)
        local kind = require("lspkind").cmp_format { mode = "text", maxwidth = 50 }(entry, vim_item)
        local strings = vim.split(kind.kind, " ", { trimempty = true })
        kind.kind = string.format(" %s  %s", icons[vim_item.kind], strings[1])
        kind.menu = " " .. (strings[2] or "") .. ""

        return kind
      end,
    }

    require("luasnip").filetype_extend("javascriptreact", { "html" })
    require("luasnip").filetype_extend("typescriptreact", { "html" })
    require("luasnip").filetype_extend("svelte", { "html" })
    require("luasnip").filetype_extend("vue", { "html" })
    require("luasnip").filetype_extend("php", { "html" })

    require("cmp").setup(opts)
    require("cmp").setup.cmdline(":", {
      mapping = require("cmp").mapping.preset.cmdline(),
      sources = {
        { name = "cmdline" },
      },
    })
  end,
  dependencies = {
    -- Icons
    {
      "onsails/lspkind.nvim",
    },
    -- For Rust
    {
      "saecki/crates.nvim",
      tag = "v0.4.0",
      opts = {},
    },
    -- Commandline completions
    {
      "hrsh7th/cmp-cmdline",
    },
    -- AI Autocomplete
    {
      "Exafunction/codeium.nvim",
      opts = {
        enable_chat = true,
      },
    },
    {
      "supermaven-inc/supermaven-nvim",
      -- commit = "df3ecf7",
      event = "User FilePost",
      opts = {
        disable_keymaps = false,
        disable_inline_completion = false,
        keymaps = {
          accept_suggestion = "<C-;>",
          clear_suggestion = "<Nop>",
          accept_word = "<C-y>",
        },
      },
    },
    {
      "L3MON4D3/LuaSnip",
      dependencies = "rafamadriz/friendly-snippets",
      build = "make install_jsregexp",
    },
  },
}
