--  NOTE: LSP Configuration
return {
  "neovim/nvim-lspconfig",
  init = function()
    vim.keymap.set("n", "<leader>lf", "<cmd>Format<cr>", { desc = "LSP | Format", silent = true })
    vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LSP | Info", silent = true })
    vim.keymap.set("n", "<leader>lR", "<cmd>LspRestart<cr>", { desc = "LSP | Restart", silent = true })

    vim.keymap.set("v", "<leader>lf", "<cmd>Format<cr>", { desc = "LSP | Format", silent = true })

    vim.keymap.set("n", "<leader>lh", function()
      if vim.fn.has "nvim-0.10" == 1 then
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end
    end, { desc = "LSP | Toggle Inlay Hints", silent = true })
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
}
