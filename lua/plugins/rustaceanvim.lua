---@type NvPluginSpec
-- NOTE: Improve Rust Development
return {
  "mrcjkb/rustaceanvim",
  version = "^4", -- Recommended
  event = "User FilePost",
  config = function()
    local extension_path = vim.fn.stdpath "data" .. "/mason/packages/codelldb/extension/"
    local codelldb_path = extension_path .. "adapter/codelldb"
    local liblldb_path = extension_path .. "lldb/lib/liblldb"
    local this_os = vim.uv.os_uname().sysname
    local cfg = require "rustaceanvim.config"
    local on_attach = require("plugins.lsp.opts").on_attach
    local capabilities = require("plugins.lsp.opts").capabilities

    -- The path is different on Windows
    if this_os:find "Windows" then
      codelldb_path = extension_path .. "adapter\\codelldb.exe"
      liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
    else
      -- The liblldb extension is .so for Linux and .dylib for MacOS
      liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
    end

    vim.g.rustaceanvim = {
      -- Plugin configuration
      tools = {},
      -- LSP configuration
      server = {
        on_attach = on_attach,
        default_settings = {
          -- rust-analyzer language server configuration
          ["rust-analyzer"] = {
            capabilities = capabilities,
          },
        },
      },
      -- DAP configuration
      dap = {
        adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
      },
    }
  end,
}
