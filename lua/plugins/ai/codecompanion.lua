---@type NvPluginSpec
-- NOTE: Code Companion

return {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
  opts = {
    strategies = {
      chat = {
        -- It requires $GEMINI_API_KEY
        adapter = "gemini",
      },
    },
    -- NOTE: The log_level is in `opts.opts`
    opts = {
      log_level = "DEBUG", -- or "TRACE"
    },
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          make_vars = true,
          make_slash_commands = true,
          show_result_in_chat = true,
        },
      },
    },
  },
  dependencies = {
    {
      "HakonHarnes/img-clip.nvim",
      opts = {
        filetypes = {
          codecompanion = {
            prompt_for_file_name = false,
            template = "[Image]($FILE_PATH)",
            use_absolute_path = true,
          },
        },
      },
    },
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  init = function()
    vim.keymap.set(
      "n",
      "<leader>a",
      "<cmd>:lua require('codecompanion').toggle({ window_opts = { layout = 'float', width = 0.6 }})<cr>",
      { desc = "CodeCompanion Chat" }
    )
  end,
}
