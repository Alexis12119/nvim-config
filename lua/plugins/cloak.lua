return {
  {
    "laytan/cloak.nvim",
    init = function()
      vim.keymap.set("n", "<leader>oC", "<cmd>CloakToggle<cr>", { desc = "Cloak | Toggle Cloak", silent = true })
    end,
    ft = { "yaml", "json", "jsonc", "toml", "env" },
    cmd = { "CloakToggle", "CloakEnable", "CloakDisable" },
    opts = {
      cloak_length = "5",
      patterns = {
        {
          file_pattern = {
            "**/*env*.{json,jsonc,yml,yaml,toml,env}",
            "**/*account*.{json,jsonc,yml,yaml,toml,env}",
            "**/*credential*.{json,jsonc,yml,yaml,toml,env}",
            "**/*password*.{json,jsonc,yml,yaml,toml,env}",
            "**/*config*.{json,jsonc,yml,yaml,toml,env}",
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
