local dap = require "dap"

-- Dart / Flutter
dap.adapters.dart = {
  type = "executable",
  command = "dart-debug-adapter",
  args = { "dart" },
}

dap.adapters.flutter = {
  type = "executable",
  command = "dart-debug-adapter",
  args = { "flutter" },
}

dap.configurations.dart = {
  {
    type = "dart",
    request = "launch",
    name = "Launch dart",
    dartSdkPath = "/opt/flutter/bin/cache/dart-sdk/", -- ensure this is correct
    flutterSdkPath = "/opt/flutter", -- ensure this is correct
    program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
    cwd = "${workspaceFolder}",
  },
  {
    type = "flutter",
    request = "launch",
    name = "Launch flutter",
    dartSdkPath = "/opt/flutter/bin/cache/dart-sdk/", -- ensure this is correct
    flutterSdkPath = "/opt/flutter", -- ensure this is correct
    program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
    cwd = "${workspaceFolder}",
  },
}
