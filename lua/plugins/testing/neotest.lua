---@type NvPluginSpec
-- NOTE: Tests
return {
  "nvim-neotest/neotest",
  init = function()
    vim.keymap.set("n", "<leader>Tt", function()
      vim.cmd 'lua require("neotest").run.run(vim.fn.expand "%")'
    end, { desc = "Neotest | Run File", silent = true })

    vim.keymap.set("n", "<leader>TT", function()
      vim.cmd 'lua require("neotest").run.run(vim.loop.cwd())'
    end, { desc = "Neotest | Run All Test Files", silent = true })

    vim.keymap.set("n", "<leader>Tr", function()
      vim.cmd 'lua require("neotest").run.run()'
    end, { desc = "Neotest | Run Nearest", silent = true })

    vim.keymap.set("n", "<leader>Td", function()
      vim.cmd 'lua require("neotest").run.run { strategy = "dap" }'
    end, { desc = "Neotest | Run Dap", silent = true })

    vim.keymap.set("n", "<leader>Ts", function()
      vim.cmd 'lua require("neotest").summary.toggle()'
    end, { desc = "Neotest | Toggle Summary", silent = true })

    vim.keymap.set("n", "<leader>To", function()
      vim.cmd 'lua require("neotest").output.open { enter = true, auto_close = true }'
    end, { desc = "Neotest | Show Output", silent = true })

    vim.keymap.set("n", "<leader>TO", function()
      vim.cmd 'lua require("neotest").output_panel.toggle()'
    end, { desc = "Neotest | Toggle Output Panel", silent = true })

    vim.keymap.set("n", "<leader>TS", function()
      vim.cmd 'lua require("neotest").run.stop()'
    end, { desc = "Neotest | Stop", silent = true })
  end,
  dependencies = {
    "nvim-neotest/neotest-python",
    -- "nvim-neotest/neotest-go", -- does not support monorepos where go.mod is not in root
    -- "marilari88/neotest-vitest",
    -- "nvim-neotest/neotest-jest",
    -- "rouge8/neotest-rust",
    -- "rcasia/neotest-java",
    "nvim-treesitter/nvim-treesitter",
    -- extra dependencies for golang debugging with suppport for monorepos
    -- ref https://github.com/fredrikaverpil/neotest-golang/?tab=readme-ov-file#example-configuration-debugging
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    {
      "fredrikaverpil/neotest-golang", -- Installation
      dependencies = {
        {
          "leoluz/nvim-dap-go",
          init = function()
            require("dap-go").setup()
          end,
        },
      },
    },
  },
  config = function()
    require("neotest").setup {
      adapters = {
        require "neotest-python" {
          runner = "pytest",
        },
        require "neotest-golang", -- Registration
      },
    }
  end,
}
