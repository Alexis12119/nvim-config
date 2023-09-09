-- https://github.com/mfussenegger/nvim-jdtls#nvim-dap-configuration for more guide.
local dap = require "dap"
dap.configurations.java = {
  {
    javaExec = "java",
  },
}
