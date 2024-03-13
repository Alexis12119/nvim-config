-- NOTE: Tests
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-go",
    -- "marilari88/neotest-vitest",
    -- "nvim-neotest/neotest-jest",
    -- "rouge8/neotest-rust",
    -- "rcasia/neotest-java",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("neotest").setup {
      adapters = {
        require "neotest-python" {
          runner = "pytest",
        },
        require "neotest-go",
      },
    }
  end,
}
