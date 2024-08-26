---@type NvPluginSpec
-- NOTE: Linting
return {
  "mfussenegger/nvim-lint",
  event = "BufReadPost",
  enabled = false,
  config = function()
    require("lint").linters_by_ft = {
      -- python = { "flake8" },
      -- ghaction = { "actionlint" },
    }

    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
