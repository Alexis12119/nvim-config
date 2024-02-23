-- https://github.com/mfussenegger/nvim-jdtls#nvim-dap-configuration for more guide.
local dap = require "dap"
dap.configurations.java = {
  {
    name = "Launch Java",
    javaExec = "java",
    request = "launch",
    type = "java",
  },
  {
    type = 'java',
    request = 'attach',
    name = "Debug (Attach) - Remote",
    hostName = "127.0.0.1",
    port = 5005,
  },
}
