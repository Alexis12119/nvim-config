-- NOTE: Check out this for guide
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
return {
  "mfussenegger/nvim-dap",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"
    vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- NOTE: Make sure to install the needed files/exectubles through mason
    require "plugins.dap.cpptools"
    require "plugins.dap.node-debug2"
    require "plugins.dap.debugpy"
    require "plugins.dap.delve"
    require "plugins.dap.js-debug"
    local mappings = {
      d = {
        name = "Dap",
        c = { ":lua require'dap'.continue()<cr>", "Continue" },
        o = { ":lua require'dap'.step_over()<cr>", "Step Over" },
        i = { ":lua require'dap'.step_into()<cr>", "Step Into" },
        u = { ":lua require'dap'.step_out()<cr>", "Step Out" },
        b = { ":lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
        d = { ":lua require'dapui'.toggle()<cr>", "Dap UI" },
      },
    }
    which_key_add(mappings, "n")
  end,
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      config = function()
        require("dapui").setup {
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
        }
      end,
    },
  },
}
