---@type LazySpec
-- NOTE: Code Runner

return {
  {
    "Zeioth/compiler.nvim",
    init = function()
      vim.keymap.set(
        "n",
        "<leader>Cr",
        "<cmd>CompilerRedo<cr>",
        { desc = "Compiler | Redo Last Action", silent = true }
      )

      vim.keymap.set("n", "<leader>Co", "<cmd>CompilerOpen<cr>", { desc = "Compiler | Open", silent = true })

      vim.keymap.set("n", "<leader>Cs", "<cmd>CompilerStop<cr>", { desc = "Compiler | Stop All Tasks", silent = true })

      vim.keymap.set(
        "n",
        "<leader>Ct",
        "<cmd>CompilerToggleResults<cr>",
        { desc = "Compiler | Toggle Results", silent = true }
      )
    end,
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = {
      {
        "stevearc/overseer.nvim",
        commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
        keys = {
          { "<leader>oo", false },
          { "<leader>ot", false },
          { "<leader>oc", false },
          { "<leader>oi", false },
          { "<leader>ob", false },
          { "<leader>oq", false },
          { "<leader>ow", false },
        },
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
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>C", group = "compiler" },
      },
    },
  },
}
