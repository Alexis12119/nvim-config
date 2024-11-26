---@type NvPluginSpec
-- NOTE: Code Runner
return {
  "Zeioth/compiler.nvim",
  init = function()
    vim.keymap.set("n", "<leader>rr", "<cmd>CompilerRedo<cr>", { desc = "Compiler | Redo Last Action", silent = true })

    vim.keymap.set("n", "<leader>ro", "<cmd>CompilerOpen<cr>", { desc = "Compiler | Open", silent = true })

    vim.keymap.set("n", "<leader>rs", "<cmd>CompilerStop<cr>", { desc = "Compiler | Stop All Tasks", silent = true })

    vim.keymap.set(
      "n",
      "<leader>rt",
      "<cmd>CompilerToggleResults<cr>",
      { desc = "Compiler | Toggle Results", silent = true }
    )
  end,
  cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
  dependencies = {
    {
      "stevearc/overseer.nvim",
      commit = "400e762648b70397d0d315e5acaf0ff3597f2d8b",
      opts = {
        task_list = {
          direction = "bottom",
          min_height = 10,
          max_height = 15,
          default_detail = 1,
        },
      },
    },
  },
  opts = {},
}
