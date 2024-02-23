-- Native LSP
return {
  "neovim/nvim-lspconfig",
  cmd = "LspInfo",
  config = function()
    dofile(vim.g.base46_cache .. "lsp")
    require "nvchad.lsp"

    local signs = { Error = "", Warn = "", Hint = "󰌵", Info = "" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    local config = {
      -- Enable virtual text
      virtual_text = true,
      -- show signs
      signs = {
        active = signs,
      },
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    })
  end,
  dependencies = {
    -- Formatting
    {
      "stevearc/conform.nvim",
      opts = require "custom.plugins.lsp.conform",
    },
    -- Linting
    {
      "mfussenegger/nvim-lint",
      enabled = false,
      config = function()
        require "custom.plugins.lsp.nvim-lint"
      end,
    },
    -- For Typescript
    {
      "pmizio/typescript-tools.nvim",
      opts = {
        settings = {
          tsserver_file_preferences = {
            includeInlayParameterNameHints = "all",
            includeCompletionsForModuleExports = true,
            quotePreference = "auto",
          },
        },
      },
    },
    {
      "williamboman/mason.nvim",
      init = function()
        require("core.utils").load_mappings "Mason"
        require("core.utils").load_mappings "LSP"
      end,
      cmd = {
        "Mason",
        "MasonInstall",
        "MasonInstallAll",
        "MasonUpdate",
        "MasonUninstall",
        "MasonUninstallAll",
        "MasonLog",
      },
      dependencies = {
        "williamboman/mason-lspconfig.nvim",
        config = function()
          require "custom.plugins.lsp.mason"
        end,
      },
      opts = {
        registries = {
          "github:nvim-java/mason-registry",
          "github:mason-org/mason-registry",
        },
      },
    },
    -- Improve Other LSP Functionalities
    {
      "nvimdev/lspsaga.nvim",
      init = function()
        require("core.utils").load_mappings "Lspsaga"
      end,
      opts = require "custom.plugins.lsp.lspsaga",
    },
    -- For Plugin Development
    {
      "folke/neodev.nvim",
      opts = require "custom.plugins.lsp.neodev",
    },
    -- For managing error and warning messages
    {
      "folke/trouble.nvim",
      init = function()
        require("core.utils").load_mappings "Trouble"
      end,
      cmd = { "TroubleToggle", "Trouble" },
      opts = require "custom.plugins.lsp.trouble",
    },
    --  Displaying References and Definition
    {
      "VidocqH/lsp-lens.nvim",
      init = function()
        require("core.utils").load_mappings "LspLens"
      end,
      opts = {
        enable = true,
      },
    },
  },
}
