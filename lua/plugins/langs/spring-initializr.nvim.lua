-- Plugin: jkeresman01/spring-initializr.nvim
-- Installed via store.nvim

---@type NvPluginSpec
return {
  "jkeresman01/spring-initializr.nvim",
  enabled = false,
  cmd = { "SpringInitializr", "SpringGenerateProject" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    -- "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("spring-initializr").setup()
  end,
  init = function()
    vim.keymap.set("n", "<leader>Si", "<cmd>SpringInitializr<cr>", { desc = "Spring | Initializr", silent = true })
    vim.keymap.set(
      "n",
      "<leader>Sp",
      "<cmd>SpringGenerateProject<cr>",
      { desc = "Spring | Generate Project", silent = true }
    )
  end,
}
