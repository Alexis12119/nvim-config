return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = "mason.nvim",
  cmd = { "DapInstall", "DapUninstall" },
  opts = {
    -- Makes a best effort to setup the various debuggers with
    -- reasonable debug configurations
    automatic_installation = true,

    -- You can provide additional configuration to the handlers,
    -- see mason-nvim-dap README for more information
    handlers = {},

    -- You'll need to check that you have the required things installed
    -- online, please don't ask me how to install them :)
    ensure_installed = {
      "stylua",
      "jq",
    },
  },
  -- mason-nvim-dap is loaded when nvim-dap loads
  config = function()
    -- NOTE: Make sure to install the needed files/exectubles through mason
    -- Load adapter settings based on nvim_dap adapter names
    require("plugins.dap.settings.coreclr")
    require("plugins.dap.settings.godot")
    require("plugins.dap.settings.bash")
    require("plugins.dap.settings.php")
    require("plugins.dap.settings.dart")
    require("plugins.dap.settings.chrome")
    require("plugins.dap.settings.firefox")
    require("plugins.dap.settings.javadbg")
    require("plugins.dap.settings.node2")
    require("plugins.dap.settings.python")
    require("plugins.dap.settings.delve")
    require("plugins.dap.settings.js")
    require("plugins.dap.settings.cppdbg")
    require("plugins.dap.settings.codelldb")
  end,
}
