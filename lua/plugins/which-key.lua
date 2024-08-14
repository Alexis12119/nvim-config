---@type NvPluginSpec
-- NOTE: Keymaps Popup/Guide
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "", -- symbol prepended to a group
    },
    preset = "modern",
    win = {
      border = vim.g.border_enabled and "rounded" or "none",
    },
    delay = function()
      return 0
    end,
  },
  config = function(_, opts)
    require("which-key").setup(opts)
    require("which-key").add {
      {
        -- { "<leader>s", group = "Sessions", icon = "󰔚" },
        { "<leader>T", group = "Tests", icon = "󰙨" },
        { "<leader>d", group = "Debugging", icon = "" },
        { "<leader>f", group = "Find", icon = "" },
        { "<leader>g", group = "Git", icon = "󰊢" },
        { "<leader>h", group = "Harpoon", icon = "" },
        { "<leader>l", group = "LSP", icon = "" },
        { "<leader>n", group = "Neovim", icon = "" },
        { "<leader>o", group = "Options", icon = "" },
        { "<leader>p", group = "Plugins", icon = "" },
        { "<leader>r", group = "Runner", icon = "" },
        { "<leader>t", group = "Terminal", icon = "" },
        { "<leader>v", group = "Venv", icon = "" },
      },
    }
  end,
}
