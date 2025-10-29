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
      check_outdated_packages_on_open = false,
      icons = {
        package_pending = " ",
        package_installed = " ",
        package_uninstalled = " ",
      },
    },
    registries = {
      "github:nvim-java/mason-registry",
      "github:mason-org/mason-registry",
    },
  },
  dependencies = {
    {
      "mason-org/mason-lspconfig.nvim",
      config = function()
        vim.schedule(function()
          local ok_mason, mason_lspconfig = pcall(require, "mason-lspconfig")
          local ok_opts, opts = pcall(require, "plugins.lsp.opts")
          if not (ok_mason and ok_opts) then
            return
          end

          local default_config = {
            capabilities = opts.capabilities,
            on_attach = opts.on_attach,
          }

          -- Default config for all servers
          vim.lsp.config("*", default_config)

          local excluded = { "ts_ls", "jdtls", "rust_analyzer" }

          local function setup_servers()
            for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
              if not vim.tbl_contains(excluded, server) then
                -- Load server-specific settings if available
                local ok_settings, settings = pcall(require, "plugins.lsp.settings." .. server)
                if ok_settings then
                  local cfg = vim.tbl_deep_extend("force", settings, default_config)
                  vim.lsp.config(server, cfg)
                end
                vim.lsp.enable(server)
              end
            end

            vim.lsp.enable "gdscript"
          end

          setup_servers()

          -- This code snippet is from Lazyvim: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/lsp/init.lua#L241-L251
          local mr = require "mason-registry"
          mr:on("package:install:success", function(pkg)
            if pkg.spec.categories[1] == "LSP" then
              vim.defer_fn(function()
                setup_servers()

                vim.notify("Auto-Enable: " .. pkg.name, vim.log.levels.INFO)
                -- retrigger FileType so buffer picks up the new server
                require("lazy.core.handler.event").trigger {
                  event = "FileType",
                  buf = vim.api.nvim_get_current_buf(),
                }
              end, 100)
            end
          end)
        end)
      end,
    },
    {
      "jay-babu/mason-nvim-dap.nvim",
      config = function()
        -- NOTE: Automatically handle debug adapters for you.
        require("mason-nvim-dap").setup {
          handlers = {
            function(config)
              require("mason-nvim-dap").default_setup(config)
            end,
          },
        }
      end,
    },
  },
}
