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
      return 500
    end,
    triggers = {
      { "<auto>", mode = "nxsot" },
      { "s", mode = "n" }, -- Enable show menu for "s" keymap, replace default nvim's behavior
    },
  },
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "whichkey")
    require("which-key").setup(opts)
    require("which-key").add {
      {
        -- { "<leader>h", group = "Harpoon", icon = "" },
        { "<leader>R", group = "Refactor", icon = "󰮓", mode = { "n", "v" } },
        { "<leader>S", group = "Sessions", icon = "󰔚" },
        { "<leader>T", group = "Tests", icon = "󰙨" },
        { "<leader>a", group = "AI", icon = "", mode = { "n", "v" } },
        { "<leader>d", group = "Debugging", icon = "" },
        { "<leader>f", group = "Find", icon = "" },
        { "<leader>g", group = "Git", icon = "󰊢" },
        { "<leader>l", group = "LSP", icon = "", mode = { "n", "v" } },
        { "<leader>m", group = "Markdown", icon = "" },
        { "<leader>n", group = "Neovim", icon = "" },
        { "<leader>o", group = "Options", icon = "" },
        { "<leader>p", group = "Plugins", icon = "" },
        { "<leader>r", group = "Runner", icon = "" },
        { "<leader>s", group = "Snapshot", icon = "", mode = { "v" } },
        { "<leader>t", group = "Terminal", icon = "" },
        { "<leader>u", group = "Utils", icon = "" },
        { "<leader>v", group = "Venv", icon = "" },
        { "<leader>z", group = "Zen", icon = "󰡌" },
        { "sc", group = "Close Buffers From" },
      },
    }
  end,
}
