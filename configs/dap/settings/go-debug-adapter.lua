local dap = require "dap"
dap.adapters.go = {
  type = "executable",
  command = "node",
  args = { "go-debug-adapter" },
}
dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    showLog = false,
    program = "${file}",
    dlvToolPath = vim.fn.exepath "dlv",
  },
}
