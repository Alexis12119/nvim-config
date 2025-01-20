---@type NvPluginSpec
-- NOTE: Package installer
return {
  "williamboman/mason.nvim",
  event = "VeryLazy",
  init = function()
    vim.keymap.set("n", "<leader>lm", "<cmd>Mason<cr>", { desc = "Mason | Installer", silent = true })
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
      local mason = require "mason"
      -- local path = require "mason-core.path"
      local mason_lspconfig = require "mason-lspconfig"
      local on_attach = require("plugins.lsp.opts").on_attach
      local on_init = require("plugins.lsp.opts").on_init
      local capabilities = require("plugins.lsp.opts").capabilities

      mason.setup {
        ui = {
          border = vim.g.border_enabled and "rounded" or "none",
          -- Whether to automatically check for new versions when opening the :Mason window.
          check_outdated_packages_on_open = false,
          icons = {
            package_pending = " ",
            package_installed = " ",
            package_uninstalled = " ",
          },
        },
        -- install_root_dir = path.concat { vim.fn.stdpath "config", "/lua/custom/mason" },
      }

      local disabled_servers = {
        "jdtls",
        "rust_analyzer",
        "ts_ls",
      }

      mason_lspconfig.setup_handlers {
        -- Automatically configure the LSP installed
        function(server_name)
          for _, name in pairs(disabled_servers) do
            if name == server_name then
              return
            end
          end

          local opts = {
            on_attach = on_attach,
            on_init = on_init,
            capabilities = capabilities,
          }

          local require_ok, server = pcall(require, "plugins.lsp.settings." .. server_name)
          if require_ok then
            opts = vim.tbl_deep_extend("force", opts, server)
          end

          require("lspconfig")[server_name].setup(opts)
        end,
      }
    end,
  },
  opts = {
    registries = {
      "github:nvim-java/mason-registry",
      "github:mason-org/mason-registry",
    },
  },
}
