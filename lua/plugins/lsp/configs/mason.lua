---@type NvPluginSpec
-- NOTE: Package installer
return {
  "williamboman/mason.nvim",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
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

      mason_lspconfig.setup {
        ensure_installed = {},
        automatic_enable = {
          exclude = {
            "jdtls", -- conflicts with nvim-jdtls
            "ts_ls", -- conflicts with typescript-tools
          },
        },
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
