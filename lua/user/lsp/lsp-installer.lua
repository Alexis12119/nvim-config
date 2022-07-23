local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local servers = {
  "jsonls",
  "sumneko_lua",
  "clangd",
  "jdtls",
  "intelephense",
  "cssls",
  "html",
  "tsserver",
  "emmet_ls",
  "pyright",
  "omnisharp",
  "yamlls",
  "gopls",
  "lemminx",
  "vimls",
  "marksman",
  "cmake",
  "powershell_es",
  -- "julials"
  -- "cssmodules_ls",
}

lsp_installer.setup {
  ensure_installed = servers,
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "",
      server_uninstalled = "➜",
    },
    border = "single",
  },
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  local require_ok, lsp = pcall(require, "user.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", lsp, opts)
  end

  lspconfig[server].setup(opts)
end
