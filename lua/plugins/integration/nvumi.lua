---@type LazySpec
-- NOTE: Natural Language Calculator
return {
  "josephburgess/nvumi",
  event = "VeryLazy",
  opts = {
    virtual_text = "newline", -- or "inline"
    prefix = " = ", -- prefix shown before the output
    date_format = "iso", -- or: "uk", "us", "long"
    width = 0.8, -- 0–1 = fraction of terminal width, >1 = absolute columns
    height = 0.8, -- 0–1 = fraction of terminal height, >1 = absolute lines
    keys = {
      run = "<CR>", -- run/refresh calculations
      reset = "R", -- reset buffer
      yank = "<leader>y", -- yank output of current line
      yank_all = "<leader>Y", -- yank all outputs
    },
    -- see below for more on custom conversions/functions
    custom_conversions = {},
    custom_functions = {},
  },
  keys = {
    {
      "<leader>N",
      "<cmd>Nvumi<cr>",
      desc = "Natural Language Calculator",
      silent = true,
    },
  },
}
