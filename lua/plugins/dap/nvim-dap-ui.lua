---@type NvPluginSpec
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
