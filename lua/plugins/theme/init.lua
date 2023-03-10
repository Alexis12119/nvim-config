return {
  {
    "Alexis12119/nightly.nvim",
    -- lazy = true,
    -- branch = "dev",
    priority = 1000,
    config = function()
      require "plugins.theme.nightly"
    end,
  },

  {
    "marko-cerovac/material.nvim",
    lazy = true,
    config = function()
      vim.g.material_style = "deep ocean"
      require "plugins.theme.material"
    end,
  },

  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require "plugins.theme.tokyonight"
    end,
  },

  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require "plugins.theme.catppuccin"
    end,
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require "plugins.theme.kanagawa"
    end,
  },

  {
    "arturgoms/moonbow.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require "plugins.theme.moonbow"
    end,
  },

  {
    "rmehri01/onenord.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require "plugins.theme.onenord"
    end,
  },

  {
    "Mofiqul/vscode.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require "plugins.theme.vscode"
    end,
  },

  {
    "navarasu/onedark.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require "plugins.theme.onedark"
    end,
  },

  {
    "tanvirtin/monokai.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require "plugins.theme.monokai"
    end,
  },

  {
    "Mofiqul/dracula.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require "plugins.theme.dracula"
    end,
  },

  {
    "JoosepAlviste/palenightfall.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require "plugins.theme.palenightfall"
    end,
  },

  {
    "bluz71/vim-nightfly-colors",
    lazy = true,
    priority = 1000,
    config = function()
      require "plugins.theme.nightfly"
    end,
  },
}
