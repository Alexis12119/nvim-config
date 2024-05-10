--  NOTE: LSP Configuration
return {
  "neovim/nvim-lspconfig",
  init = function()
    vim.keymap.set("n", "<leader>lf", "<cmd>Format<cr>", { desc = "LSP | Format", silent = true })
    vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LSP | Info", silent = true })
    vim.keymap.set("n", "<leader>lR", "<cmd>LspRestart<cr>", { desc = "LSP | Restart", silent = true })

    vim.keymap.set("v", "<leader>lf", "<cmd>Format<cr>", { desc = "LSP | Format", silent = true })

    vim.keymap.set("n", "<leader>lh", function()
      if vim.lsp.inlay_hint.is_enabled(0) and vim.fn.has "nvim-0.10" == 1 then
        vim.cmd "lua=vim.lsp.inlay_hint.enable(0, false)"
      else
        vim.cmd "lua=vim.lsp.inlay_hint.enable(0, true)"
      end
    end, { desc = "LSP | Inlay Hints", silent = true })
  end,
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
    -- NOTE: Formatting
    {
      "stevearc/conform.nvim",
      opts = require "plugins.lsp.conform",
    },
    -- NOTE: Linting
    {
      "mfussenegger/nvim-lint",
      enabled = false,
      config = function()
        require "plugins.lsp.nvim-lint"
      end,
    },
    -- NOTE: For Typescript
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
    -- NOTE: Package installer
    {
      "williamboman/mason.nvim",
      init = function()
        vim.keymap.set("n", "<leader>lm", "<cmd>Mason<cr>", { desc = "Mason |  Installer", silent = true })
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
          require "plugins.lsp.mason"
        end,
      },
      opts = {
        registries = {
          "github:nvim-java/mason-registry",
          "github:mason-org/mason-registry",
        },
      },
    },
    -- NOTE: Improve Other LSP Functionalities
    {
      "nvimdev/lspsaga.nvim",
      init = function()
        vim.keymap.set(
          "n",
          "<leader>la",
          "<cmd>Lspsaga code_action<cr>",
          { desc = "Lspsaga | Code Action", silent = true }
        )
        vim.keymap.set(
          "n",
          "<leader>lo",
          "<cmd>Lspsaga outline<cr>",
          { desc = "Lspsaga | Code Outline", silent = true }
        )
        vim.keymap.set(
          "n",
          "<leader>lI",
          "<cmd>Lspsaga incoming_calls<cr>",
          { desc = "Lspsaga | Incoming Calls", silent = true }
        )
        vim.keymap.set(
          "n",
          "<leader>lO",
          "<cmd>Lspsaga outgoing_calls<cr>",
          { desc = "Lspsaga | Outgoing Calls", silent = true }
        )
        vim.keymap.set("n", "<leader>lr", "<cmd>Lspsaga rename<cr>", { desc = "Lspsaga | Rename", silent = true })
        vim.keymap.set(
          "n",
          "<leader>lj",
          "<cmd>Lspsaga diagnostic_jump_next<cr>",
          { desc = "Lspsaga | Next Diagnostic", silent = true }
        )
        vim.keymap.set(
          "n",
          "<leader>lk",
          "<cmd>Lspsaga diagnostic_jump_prev<cr>",
          { desc = "Lspsaga | Prev Diagnostic", silent = true }
        )

        vim.keymap.set(
          "v",
          "<leader>la",
          "<cmd>Lspsaga code_action<cr>",
          { desc = "Lspsaga | Code Action", silent = true }
        )
      end,
      opts = require "plugins.lsp.lspsaga",
    },
    -- NOTE: For Plugin Development
    {
      "folke/neodev.nvim",
      opts = require "plugins.lsp.neodev",
    },
    -- NOTE: For managing error and warning messages
    {
      "folke/trouble.nvim",
      init = function()
        vim.keymap.set(
          "n",
          "<leader>lb",
          "<cmd>TroubleToggle document_diagnostics<cr>",
          { desc = "Trouble | Buffer Diagnostics", silent = true }
        )
        vim.keymap.set(
          "n",
          "<leader>lw",
          "<cmd>TroubleToggle workspace_diagnostics<cr>",
          { desc = "Trouble | Workspace Diagnostics", silent = true }
        )
        vim.keymap.set("n", "<leader>fT", "<cmd>TodoTelescope<cr>", { desc = "Trouble | Todo", silent = true })
      end,
      cmd = { "TroubleToggle", "Trouble" },
      opts = require "plugins.lsp.trouble",
      config = function()
        dofile(vim.g.base46_cache .. "trouble")
      end,
    },
    -- NOTE: Displaying References and Definition
    {
      "VidocqH/lsp-lens.nvim",
      init = function()
        vim.keymap.set(
          "n",
          "<leader>ll",
          "<cmd>LspLensToggle<cr>",
          { desc = "LspLens | Toggle Code Lens", silent = true }
        )
      end,
      opts = {
        enable = true,
      },
    },
  },
}
