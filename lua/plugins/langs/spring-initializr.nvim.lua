-- Plugin: jkeresman01/spring-initializr.nvim
-- Installed via store.nvim

---@type NvPluginSpec
return {
  "jkeresman01/spring-initializr.nvim",
  cmd = { "SpringInitializr", "SpringGenerateProject" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("spring-initializr").setup()
  end,
}
