---@type NvPluginSpec
-- NOTE: Debugging
return {
  "rcarriga/nvim-dap-ui",
  keys = {
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "DAP | Continue",
      silent = true,
    },
    {
      "<leader>do",
      function()
        require("dap").step_over()
      end,
      desc = "DAP | Step Over",
      silent = true,
    },
    {
      "<leader>di",
      function()
        require("dap").step_into()
      end,
      desc = "DAP | Step Into",
      silent = true,
    },
    {
      "<leader>du",
      function()
        require("dap").step_out()
      end,
      desc = "DAP | Step Out",
      silent = true,
    },
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "DAP | Breakpoint",
      silent = true,
    },
    {
      "<leader>dB",
      function()
        require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
      end,
      desc = "DAP | Breakpoint Condition",
      silent = true,
    },
    {
      "<leader>dd",
      function()
        require("dapui").toggle()
      end,
      desc = "DAP | Dap UI",
      silent = true,
    },
    {
      "<leader>dl",
      function()
        require("dap").run_last()
      end,
      desc = "DAP | Run Last",
      silent = true,
    },
  },
  dependencies = {
    { "nvim-neotest/nvim-nio" },
    { "theHamsta/nvim-dap-virtual-text", opts = {} },
    { "mfussenegger/nvim-dap" },
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
