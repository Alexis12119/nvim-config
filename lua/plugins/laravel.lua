return {
  "adalessa/laravel.nvim",
  dependencies = {
    "tpope/vim-dotenv",
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-neotest/nvim-nio",
  },
  cmd = { "Laravel" },
  keys = {
    {
      "<leader>Ll",
      function()
        Laravel.pickers.laravel()
      end,
      desc = "Laravel: Open Laravel Picker",
    },
    {
      "<c-g>",
      function()
        Laravel.commands.run "view:finder"
      end,
      desc = "Laravel: Open View Finder",
    },
    {
      "<leader>La",
      function()
        Laravel.pickers.artisan()
      end,
      desc = "Laravel: Open Artisan Picker",
    },
    {
      "<leader>Lt",
      function()
        Laravel.commands.run "actions"
      end,
      desc = "Laravel: Open Actions Picker",
    },
    {
      "<leader>Lr",
      function()
        Laravel.pickers.routes()
      end,
      desc = "Laravel: Open Routes Picker",
    },
    {
      "<leader>Lh",
      function()
        Laravel.run "artisan docs"
      end,
      desc = "Laravel: Open Documentation",
    },
    {
      "<leader>Lm",
      function()
        Laravel.pickers.make()
      end,
      desc = "Laravel: Open Make Picker",
    },
    {
      "<leader>Lc",
      function()
        Laravel.pickers.commands()
      end,
      desc = "Laravel: Open Commands Picker",
    },
    {
      "<leader>Lo",
      function()
        Laravel.pickers.resources()
      end,
      desc = "Laravel: Open Resources Picker",
    },
    {
      "<leader>Lp",
      function()
        Laravel.commands.run "command_center"
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
  event = { "VeryLazy" },
  opts = {
    lsp_server = "intelephense", -- "phpactor | intelephense"
    features = {
      pickers = {
        provider = "telescope", -- "snacks | telescope | fzf-lua | ui-select"
      },
    },
  },
}
