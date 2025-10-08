---@type NvPluginSpec
-- NOTE: Better Markdown
return {
  "OXY2DEV/markview.nvim",
  -- lazy = false,
  ft = { "markdown", "Avante", "codecompanion", "opencode_output" },
  init = function()
    vim.keymap.set("n", "<leader>m", function()
      if vim.bo.filetype == "markdown" then
        vim.cmd "Markview Toggle"
      else
        vim.notify("Only available in markdown", vim.log.levels.WARN, { title = "Markview" })
      end
    end, { desc = "Toggle Markview", silent = true })
  end,
  opts = {
    preview = {
      filetypes = { "markdown", "Avante", "codecompanion", "opencode_output" },
      ignore_buftypes = {},
    },
    max_length = 99999,
    experimental = { check_rtp_message = false },
  },
  -- enabled = false,
  -- ft = "markdown" -- If you decide to lazy-load anyway
  dependencies = {
    -- You will not need this if you installed the
    -- parsers manually
    -- Or if the parsers are in your $RUNTIMEPATH
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}
