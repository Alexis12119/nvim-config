-- Debugging
return {
  "rcarriga/nvim-dap-ui",
  init = function()
    require("core.utils").load_mappings "Dap"
  end,
  dependencies = {
    {
      "mfussenegger/nvim-dap",
      config = function()
        -- NOTE: Check out this for guide
        -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
        local dap = require "dap"
        vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

        local dapui = require "dapui"
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end

        -- dap.listeners.before.event_terminated["dapui_config"] = function()
        --   dapui.close()
        -- end

        -- dap.listeners.before.event_exited["dapui_config"] = function()
        --   dapui.close()
        -- end

        -- NOTE: Make sure to install the needed files/exectubles through mason
        require "custom.plugins.dap.settings.cpptools"
        require "custom.plugins.dap.settings.netcoredbg"
        require "custom.plugins.dap.settings.godot"
        require "custom.plugins.dap.settings.bash-debug-adapter"
        require "custom.plugins.dap.settings.php-debug-adapter"
        require "custom.plugins.dap.settings.dart-debug-adapter"
        require "custom.plugins.dap.settings.chrome-debug-adapter"
        require "custom.plugins.dap.settings.firefox-debug-adapter"
        require "custom.plugins.dap.settings.java-debug"
        require "custom.plugins.dap.settings.node-debug2"
        require "custom.plugins.dap.settings.debugpy"
        require "custom.plugins.dap.settings.go-debug-adapter"
        require "custom.plugins.dap.settings.js-debug"
      end,
    },
  },
  opts = {
    layouts = {
      {
        elements = {
          -- Elements can be strings or table with id and size keys.
          { id = "scopes", size = 0.25 },
          "breakpoints",
          "stacks",
          "watches",
        },
        size = 40, -- 40 columns
        position = "left",
      },
      {
        elements = {
          "repl",
          "console",
        },
        size = 0.25, -- 25% of total lines
        position = "bottom",
      },
    },
  },
}
