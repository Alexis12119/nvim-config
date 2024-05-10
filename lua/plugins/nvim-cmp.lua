-- NOTE: Completion Engine
return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  opts = function(_, opts)
    local cmp = require "cmp"
    local neogen = require "neogen"
    local luasnip = require "luasnip"
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "cmdline" },
      },
    })
    -- Copilot tab completion: https://github.com/zbirenbaum/copilot-cmp?tab=readme-ov-file#tab-completion-configuration-highly-recommended
    -- Neogen tab cycling: https://github.com/danymat/neogen?tab=readme-ov-file#default-cycling-support
    -- Supertab from LazyVim: https://www.lazyvim.org/configuration/recipes#supertab
    local has_words_before = function()
      if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
        return false
      end
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match "^%s*$" == nil
    end
    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() and has_words_before() then
          cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
        elseif neogen.jumpable() then
          neogen.jump_next()
        elseif cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-tab>"] = cmp.mapping(function(fallback)
        if neogen.jumpable(true) then
          neogen.jump_prev()
        elseif cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<A-;>"] = cmp.mapping.complete(), -- For Windows Terminal: Send Ctrl+Space into Alt+;
    })
  end,

  config = function(_, opts)
    -- table.insert(opts.sources, 2, { name = "codeium" })
    table.insert(opts.sources, 2, { name = "copilot" })
    opts.mapping = vim.tbl_extend("force", {}, opts.mapping, {
      -- You can add here new mappings.
    })

    local luasnip = require "luasnip"
    luasnip.filetype_extend("javascriptreact", { "html" })
    luasnip.filetype_extend("typescriptreact", { "html" })
    luasnip.filetype_extend("svelte", { "html" })
    luasnip.filetype_extend("vue", { "html" })

    opts.completion["completeopt"] = "menu,menuone,noselect" -- disable autoselect
    require("cmp").setup(opts)
  end,
  dependencies = {
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
      enabled = false,
      opts = {},
    },
    -- AI Copilot
    {
      "zbirenbaum/copilot-cmp",
      dependencies = { "zbirenbaum/copilot.lua" },
      fix_pairs = true,
      config = true,
    },
    {
      "L3MON4D3/LuaSnip",
      dependencies = "rafamadriz/friendly-snippets",
    },
    -- Neogen
    {
      "danymat/neogen",
      cmd = "Neogen",
      config = true,
      init = function()
        vim.keymap.set("n", "<leader>ln", "<cmd>NvimTreeToggle<cr>", { desc = "Neogen | Gen Docs", silent = true })
      end,
    },
  },
}
