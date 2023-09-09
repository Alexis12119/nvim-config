-- NOTE: Check out this for guide
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
local dap = require "dap"
vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

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
require "custom.configs.dap.cpptools"
require "custom.configs.dap.java-debug"
require "custom.configs.dap.node-debug2"
require "custom.configs.dap.debugpy"
require "custom.configs.dap.go-debug-adapter"
require "custom.configs.dap.js-debug"
