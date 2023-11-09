local dap = require "dap"

dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { "php-debug-adapter" },
}

dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Listen for Xdebug",
    port = 9000,
  },
}
