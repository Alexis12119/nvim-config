return {
  {
    "laytan/cloak.nvim",
    init = function()
      vim.keymap.set("n", "<leader>oc", "<cmd>CloakToggle<cr>", { desc = "Cloak | Toggle", silent = true })
    end,
    cmd = { "CloakToggle" },
    opts = {
      cloak_length = "5",
      patterns = {
        {
          file_pattern = {
            "**/*env*.{json,yml,yaml,toml}",
            "**/*account*.{json,yml,yaml,toml}",
            "**/*credential*.{json,yml,yaml,toml}",
            "**/*password*.{json,yml,yaml,toml}",
            "**/*config*.{json,yml,yaml,toml}",
          },
          cloak_pattern = {
            "=.+",
            "-.+",
            ":.+",
          },
        },
      },
    },
  },
}
