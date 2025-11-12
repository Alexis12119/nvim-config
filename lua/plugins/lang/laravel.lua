---@type LazySpec
-- NOTE: For Laravel Development
return {
  "adalessa/laravel.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>cLl",
      function()
        Laravel.pickers.laravel()
      end,
      desc = "Laravel: Open Laravel Picker",
    },
    {
      "<c-g>",
      function()
        Laravel.commands.run("view:finder")
      end,
      desc = "Laravel: Open View Finder",
    },
    {
      "<leader>cLa",
      function()
        Laravel.pickers.artisan()
      end,
      desc = "Laravel: Open Artisan Picker",
    },
    {
      "<leader>cLt",
      function()
        Laravel.commands.run("actions")
      end,
      desc = "Laravel: Open Actions Picker",
    },
    {
      "<leader>cLr",
      function()
        Laravel.pickers.routes()
      end,
      desc = "Laravel: Open Routes Picker",
    },
    {
      "<leader>cLh",
      function()
        Laravel.run("artisan docs")
      end,
      desc = "Laravel: Open Documentation",
    },
    {
      "<leader>cLm",
      function()
        Laravel.pickers.make()
      end,
      desc = "Laravel: Open Make Picker",
    },
    {
      "<leader>cLc",
      function()
        Laravel.pickers.commands()
      end,
      desc = "Laravel: Open Commands Picker",
    },
    {
      "<leader>cLo",
      function()
        Laravel.pickers.resources()
      end,
      desc = "Laravel: Open Resources Picker",
    },
    {
      "<leader>cLp",
      function()
        Laravel.commands.run("command_center")
      end,
      desc = "Laravel: Open Command Center",
    },
    {
      "gf",
      function()
        local ok, res = pcall(function()
          if Laravel.app("gf").cursorOnResource() then
            return "<cmd>lua Laravel.commands.run('gf')<cr>"
          end
        end)
        if not ok or not res then
          return "gf"
        end
        return res
      end,
      expr = true,
      noremap = true,
    },
  },
  opts = {
    lsp_server = "intelephense", -- "phpactor | intelephense"
    features = {
      pickers = {
        provider = "snacks", -- "snacks | telescope | fzf-lua | ui-select"
      },
    },
  },
  dependencies = {
    "tpope/vim-dotenv",
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-neotest/nvim-nio",
    {
      "ricardoramirezr/blade-nav.nvim",
      ft = { "blade", "php" }, -- optional, improves startup time
      opts = {
        -- This applies for nvim-cmp and coq, for blink refer to the configuration of this plugin
        close_tag_on_complete = true, -- default: true
      },
    },
    {
      "folke/which-key.nvim",
      optional = true,
      opts = {
        spec = {
          { "<leader>cL", group = "Laravel" },
        },
      },
    },
  },
}
