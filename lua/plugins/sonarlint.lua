---@type NvPluginSpec
-- NOTE: SonarLint
return {
  url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
  cond = false,
  ft = { "python", "cpp", "java" },
  config = function()
    local mason = vim.fn.stdpath "data" .. "/mason"
    require("sonarlint").setup {
      server = {
        cmd = {
          mason .. "/bin/sonarlint-language-server",
          -- Ensure that sonarlint-language-server uses stdio channel
          "-stdio",
          "-analyzers",
          -- paths to the analyzers you need, using those for python and java in this example
          mason .. "/share/sonarlint-analyzers/sonarpython.jar",
          mason .. "/share/sonarlint-analyzers/sonarcfamily.jar",
          mason .. "/share/sonarlint-analyzers/sonarjava.jar",
        },
      },
      filetypes = {
        -- Tested and working
        "python",
        "cpp",
        "java",
      },
    }
  end,
}
