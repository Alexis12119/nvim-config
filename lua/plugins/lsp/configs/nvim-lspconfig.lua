---@type NvPluginSpec
--  NOTE: LSP Configuration
return {
  "neovim/nvim-lspconfig",
  init = function()
    vim.keymap.set("n", "<leader>lf", "<cmd>Format<cr>", { desc = "LSP | Format", silent = true })
    vim.keymap.set("n", "<leader>lF", "<cmd>FormatToggle<cr>", { desc = "LSP | Toggle Autoformat", silent = true })
    vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LSP | Info", silent = true })
    vim.keymap.set("n", "<leader>lR", "<cmd>LspRestart<cr>", { desc = "LSP | Restart", silent = true })

    vim.keymap.set("n", "<leader>lh", function()
      if vim.version().minor >= 10 then
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end
    end, { desc = "LSP | Toggle Inlay Hints", silent = true })
  end,
  cmd = "LspInfo",
  config = function()
    local config = {
      -- Enable virtual text
      virtual_text = false,
      update_in_insert = false,
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

    local signs = { Error = "", Warn = "", Hint = "󰌵", Info = "" }

    if vim.version().minor >= 11 then
      config.signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = signs.Error,
          [vim.diagnostic.severity.WARN] = signs.Warn,
          [vim.diagnostic.severity.HINT] = signs.Hint,
          [vim.diagnostic.severity.INFO] = signs.Info,
        },
        linehl = {
          [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
          [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
          [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
          [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
          [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
          [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
          [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
        },
      }
    else
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
      config.signs = { active = signs }
    end

    vim.diagnostic.config(config)

    if vim.g.border_enabled then
      -- NOTE: Enable border for LSP UI Windows (lspinfo)
      require("lspconfig.ui.windows").default_options.border = "rounded"

      -- NOTE: Enable border for LSP hover, signature help. But cannot use along with Noice's hover, signature help!

      --   vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      --     border = "rounded",
      --   })
      --   vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      --     border = "rounded",
      --   })
    end
  end,
}
