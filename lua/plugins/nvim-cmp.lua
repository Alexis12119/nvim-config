-- NOTE: Completion Engine

--NOTE: Supertab setup referenced from LazyVim documentation
-- Supertab from LazyVim: https://www.lazyvim.org/configuration/recipes#supertab
-- Copilot tab completion: https://github.com/zbirenbaum/copilot-cmp?tab=readme-ov-file#tab-completion-configuration-highly-recommended
-- Neogen tab cycling: https://github.com/danymat/neogen?tab=readme-ov-file#default-cycling-support

local setup_supertab_forward = function(cmp)
  -- local neogen = require "neogen"

  local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
  end

  return cmp.mapping(function(fallback)
    if cmp.visible() then
      -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
      cmp.select_next_item()
      -- elseif neogen.jumpable() then
      --   neogen.jump_next()
      -- elseif luasnip.expand_or_jumpable() then
      --   luasnip.expand_or_jump()
      -- elseif luasnip.expandable() then
      --   luasnip.expand()
      -- elseif luasnip.jumpable() then
      --   luasnip.jump()
    elseif vim.snippet.active { direction = 1 } then
      vim.schedule(function()
        vim.snippet.jump(1)
      end)
    elseif has_words_before() then
      cmp.complete()
    else
      fallback()
    end
  end, { "i", "s" })
end

local setup_supertab_backward = function(cmp)
  return cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
      -- elseif neogen.jumpable(true) then
      --   neogen.jump_prev()
    elseif vim.snippet.active { direction = -1 } then
      vim.schedule(function()
        vim.snippet.jump(-1)
      end)
    else
      fallback()
    end
  end, { "i", "s" })
end

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
    -- table.insert(opts.sources, 2, { name = "copilot" })
    -- table.insert(opts.sources, 2, { name = "codeium" })
    -- table.insert(opts.sources, 1, { name = "supermaven" })
    opts.mapping = vim.tbl_extend("force", {}, opts.mapping, {
      -- You can add here new mappings.
      ["<tab>"] = setup_supertab_forward(require "cmp"),
      ["<S-tab>"] = setup_supertab_backward(require "cmp"),
      ["<A-;>"] = require("cmp").mapping.complete(), -- For Windows Terminal: Send Ctrl+Space into Alt+;
    })
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

    opts.completion["completeopt"] = "menu,menuone,noselect" -- disable autoselect

    --NOTE: add border for cmp window

    if vim.g.border_enabled then
      opts.window = {
        completion = require("cmp").config.window.bordered(),
        documentation = require("cmp").config.window.bordered(),
      }
    end

    require("cmp").setup(opts)
    require("cmp").setup.cmdline(":", {
      mapping = require("cmp").mapping.preset.cmdline(),
      sources = {
        { name = "cmdline" },
      },
    })
  end,
  dependencies = {
    {
      "onsails/lspkind.nvim",
    },
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
    -- {
    --   "zbirenbaum/copilot-cmp",
    --   dependencies = { "zbirenbaum/copilot.lua" },
    --   fix_pairs = true,
    --   config = true,
    -- },
    {
      "supermaven-inc/supermaven-nvim",
      enabled = false,
      event = "User FilePost",
      opts = {
        -- disable_keymaps = true,
        -- disable_inline_completion = true,
        keymaps = {
          accept_suggestion = "<C-y>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-j>",
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
