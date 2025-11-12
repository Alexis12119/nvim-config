local dap = require "dap"

dap.adapters.firefox = {
  type = "executable",
  command = "node",
  args = { "firefox-debug-adapter" },
}

dap.configurations.typescript = {
  {
    name = "Debug with Firefox",
    type = "firefox",
    request = "launch",
    reAttach = true,
    url = "http://localhost:3000",
    webRoot = "${workspaceFolder}",
    firefoxExecutable = "/usr/bin/firefox",
  },
}
