local M = {}
local keymap = vim.keymap.set

local cmp_nvim_lsp = require "cmp_nvim_lsp"

-- M.capabilities = vim.lsp.protocol.make_client_capabilities()
-- M.capabilities.offsetEncoding = { "utf-16" }
-- M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities()

M.setup = function()
  local signs = { Error = "", Warn = "", Hint = "", Info = "" }
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

local function disable_format_on_save()
  vim.api.nvim_del_augroup_by_name "Format on save"
  vim.notify("Format on save is now disabled", vim.log.levels.INFO, { title = "Format" })
end

local function enable_format_on_save()
  vim.api.nvim_create_augroup("Format on save", { clear = false })
  vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
      vim.lsp.buf.format {
        async = true,
        filter = function(client)
          -- if client.supports_method "textDocument/formatting" then
          --   return client.name ~= "null-ls"
          -- end
          return client.name == "null-ls"
        end,
      }
      vim.notify("Format Done", vim.log.levels.INFO, { title = "Format" })
    end,
    group = "Format on save",
  })
  vim.notify("Format on save is now enabled", vim.log.levels.INFO, { title = "Format" })
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  lsp_highlight(client, bufnr)
  vim.api.nvim_create_user_command("FormatOnSaveToggle", function()
    if vim.fn.exists "#Format on save#BufWritePre" == 0 then
      enable_format_on_save()
    else
      disable_format_on_save()
    end
  end, { nargs = "*" })
end

return M
