return {
  "ThePrimeagen/refactoring.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  init = function()
    vim.keymap.set(
      {"n", "v"},
      "<leader>Rs",
      function()
        -- require("refactoring").select_refactor()
        require("telescope").extensions.refactoring.refactors()
      end,
      { desc = "Refactor | Select", silent = true }
    )
    vim.keymap.set({"n", "v"}, "<leader>Ri", "<cmd>Refactor inline_var<cr>", { desc = "Refactor | Extract Inline Variable", silent = true })
    vim.keymap.set("n", "<leader>RI", "<cmd>Refactor inline_func<cr>", { desc = "Refactor | Extract Inline Function", silent = true })
    vim.keymap.set("n", "<leader>Rb", "<cmd>Refactor extract_block<cr>", { desc = "Refactor | Extract Block", silent = true })
    vim.keymap.set("n", "<leader>RB", "<cmd>Refactor extract_block_to_file<cr>", { desc = "Refactor | Extract Block to File", silent = true })
    vim.keymap.set("v", "<leader>Re", "<cmd>Refactor extract<cr>", { desc = "Refactor | Extract", silent = true })
    vim.keymap.set("v", "<leader>Rf", "<cmd>Refactor extract_to_file<cr>", { desc = "Refactor | Extract to File", silent = true })
    vim.keymap.set("v", "<leader>Rv", "<cmd>Refactor Refactor extract_var<cr>", { desc = "Refactor | Extract Variable", silent = true })
  end,
  opts = {
    prompt_func_return_type = {
      c = false,
      cpp = false,
      cxx = false,
      go = false,
      h = false,
      hpp = false,
      java = false,
    },
    prompt_func_param_type = {
      c = false,
      cpp = false,
      cxx = false,
      go = false,
      h = false,
      hpp = false,
      java = false,
    },
    printf_statements = {},
    print_var_statements = {},
    show_success_message = false,
  },
  config = function()
    require("refactoring").setup()
  end,
}
