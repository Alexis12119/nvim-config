-- NOTE: Debugging
return {
  "rcarriga/nvim-dap-ui",
  init = function()
    vim.keymap.set(
      "n",
      "<leader>dc",
      "<cmd>lua require'dap'.continue()<cr>",
      { desc = "DAP | Continue", silent = true }
    )

    vim.keymap.set(
      "n",
      "<leader>do",
      "<cmd>lua require'dap'.step_over()<cr>",
      { desc = "DAP | Step Over", silent = true }
    )

    vim.keymap.set(
      "n",
      "<leader>di",
      "<cmd>lua require'dap'.step_into()<cr>",
      { desc = "DAP | Step Into", silent = true }
    )

    vim.keymap.set(
      "n",
      "<leader>du",
      "<cmd>lua require'dap'.step_out()<cr>",
      { desc = "DAP | Step Out", silent = true }
    )

    vim.keymap.set(
      "n",
      "<leader>db",
      "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
      { desc = "DAP | Breakpoint", silent = true }
    )

    vim.keymap.set(
      "n",
      "<leader>dB",
      "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
      { desc = "DAP | Breakpoint Condition", silent = true }
    )

    vim.keymap.set("n", "<leader>dd", "<cmd>lua require'dapui'.toggle()<cr>", { desc = "DAP | Dap UI", silent = true })

    vim.keymap.set(
      "n",
      "<leader>dl",
      "<cmd>lua require'dap'.run_last()<cr>",
      { desc = "DAP | Run Last", silent = true }
    )
  end,
  dependencies = {
    { "nvim-neotest/nvim-nio" },
    {
      "mfussenegger/nvim-dap",
      config = function()
        -- NOTE: Check out this for guide
        -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
        dofile(vim.g.base46_cache .. "dap")
        local dap = require "dap"
        vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

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
        require "plugins.dap.settings.cpptools"
        require "plugins.dap.settings.netcoredbg"
        require "plugins.dap.settings.godot"
        require "plugins.dap.settings.bash-debug-adapter"
        require "plugins.dap.settings.php-debug-adapter"
        require "plugins.dap.settings.dart-debug-adapter"
        require "plugins.dap.settings.chrome-debug-adapter"
        require "plugins.dap.settings.firefox-debug-adapter"
        require "plugins.dap.settings.java-debug"
        require "plugins.dap.settings.node-debug2"
        require "plugins.dap.settings.debugpy"
        require "plugins.dap.settings.go-debug-adapter"
        require "plugins.dap.settings.js-debug"
      end,
    },
  },
  opts = {
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
  },
}
