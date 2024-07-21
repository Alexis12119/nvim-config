return {
  {
    "laytan/cloak.nvim",
    init = function()
      vim.keymap.set("n", "<leader>oH", "<cmd>CloakToggle<cr>", { desc = "Cloak | Toggle Cloak", silent = true })
      vim.keymap.set("n", "<leader>oh", "<cmd>CloakPreviewLine<cr>", { desc = "Cloak | Preview Line", silent = true })
    end,
    ft = {
      "yaml",
      "json",
      "jsonc",
      "toml",
      "env",
    },
    cmd = {
      "CloakToggle",
      "CloakEnable",
      "CloakDisable",
      "CloakPreviewLine",
    },
    opts = {
      cloak_length = "5",
      patterns = {
        {
          file_pattern = {
            ".env*",
            "*{account,credential,password,config}*.{json,jsonc,yml,yaml,toml,env}",
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
