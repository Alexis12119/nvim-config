---@type NvPluginSpec
-- NOTE: Package installer
return {
  "mason-org/mason.nvim",
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
  opts = {
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
    registries = {
      "github:nvim-java/mason-registry",
      "github:mason-org/mason-registry",
    },
  },
  dependencies = {
    {
      "mason-org/mason-lspconfig.nvim",
      config = function()
        -- NOTE: Load LSP Installed
        vim.schedule(function()
          local ok_mason, mason_lspconfig = pcall(require, "mason-lspconfig")
          local ok_opts, opts = pcall(require, "plugins.lsp.opts")
          if not (ok_mason and ok_opts) then
            return
          end

          vim.lsp.config("*", {
            capabilities = opts.capabilities,
            on_attach = opts.on_attach,
            on_init = opts.on_init,
          })

          local servers = mason_lspconfig.get_installed_servers()
          local excluded = { "ts_ls", "jdtls" }

          for _, server in ipairs(servers) do
            if not vim.tbl_contains(excluded, server) then
              -- Load LSP Settings(If Exists)
              local ok_settings, settings = pcall(require, "plugins.lsp.settings." .. server)
              if ok_settings then
                vim.lsp.config(string.lower(server), settings)
              end

              -- Enable LSP
              vim.lsp.enable(server)
            end
          end
        end)
      end,
    },
  },
}
