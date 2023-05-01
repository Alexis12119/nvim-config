local dap = require "dap"
local executable = ""

if vim.fn.has "win32" == 1 then
  executable = "OpenDebugAD7.exe"
else
  executable = "OpenDebugAD7"
end

dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = vim.fn.stdpath "data" .. "/mason/packages/cpptools/extension/debugAdapters/bin/" .. executable,
  options = {
    detached = false,
  },
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = true,
  },
}

-- If you want to use this for Rust and C, add something like this:
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
