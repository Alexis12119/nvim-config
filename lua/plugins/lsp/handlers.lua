local M = {}
local keymap = vim.keymap.set

local cmp_nvim_lsp = require "cmp_nvim_lsp"

M.capabilities = cmp_nvim_lsp.default_capabilities()

M.setup = function()
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

  -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  --   border = "rounded",
  -- })

  -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  --   border = "rounded",
  -- })
end

local function lsp_keymaps(bufnr)
  local buf_opts = { buffer = bufnr, silent = true }
  -- keymap("n", "gD", vim.lsp.buf.declaration, buf_opts)
  keymap("n", "gD", ":Lspsaga lsp_finder<CR>", buf_opts)
  keymap("n", "gd", ":Lspsaga goto_definition<CR>", buf_opts)
  -- keymap("n", "gd", vim.lsp.buf.definition, buf_opts)
  keymap("n", "gl", ":Lspsaga show_line_diagnostics<CR>", buf_opts)
  keymap("n", "gc", ":Lspsaga show_cursor_diagnostics<CR>", buf_opts)
  keymap("n", "gp", ":Lspsaga peek_definition<CR>", buf_opts)
  -- keymap("n", "K", vim.lsp.buf.hover, buf_opts)
  keymap("n", "K", ":Lspsaga hover_doc<CR>", buf_opts)
  keymap("n", "gi", vim.lsp.buf.implementation, buf_opts)
end

-- Highlight symbol under cursor
local function lsp_highlight(client, bufnr)
  if client.supports_method "textDocument/documentHighlight" then
    vim.api.nvim_create_augroup("lsp_document_highlight", {
      clear = false,
    })
    vim.api.nvim_clear_autocmds {
      buffer = bufnr,
      group = "lsp_document_highlight",
    }
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  lsp_highlight(client, bufnr)

  client.server_capabilities.semanticTokensProvider = nil
end

return M
