-- NOTE: Debugging
return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    { "nvim-neotest/nvim-nio" },
    {
      "mfussenegger/nvim-dap",
      config = function()
        -- NOTE: Check out this for guide
        -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
        dofile(vim.g.base46_cache .. "dap")
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
        require "plugins.dap.settings.cpptools"
        require "plugins.dap.settings.netcoredbg"
        require "plugins.dap.settings.godot"
        require "plugins.dap.settings.bash-debug-adapter"
        require "plugins.dap.settings.php-debug-adapter"
        require "plugins.dap.settings.dart-debug-adapter"
        require "plugins.dap.settings.chrome-debug-adapter"
        require "plugins.dap.settings.firefox-debug-adapter"
        require "plugins.dap.settings.java-debug"
        require "plugins.dap.settings.node-debug2"
        require "plugins.dap.settings.debugpy"
        require "plugins.dap.settings.go-debug-adapter"
        require "plugins.dap.settings.js-debug"
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
