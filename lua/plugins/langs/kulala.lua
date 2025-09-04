---@type NvPluginSpec
-- NOTE: HTTP Client

return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  opts = {
    global_keymaps = {
      ["Send request"] = { -- sets global mapping
        "<leader>Hs",
        function()
          require("kulala").run()
        end,
        mode = { "n", "v" }, -- optional mode, default is n
        desc = "Send request", -- optional description, otherwise inferred from the key
      },
      ["Send all requests"] = {
        "<leader>Ha",
        function()
          require("kulala").run_all()
        end,
        mode = { "n", "v" },
        ft = "http", -- sets mapping for *.http files only
      },
      ["Replay the last request"] = {
        "<leader>Hr",
        function()
          require("kulala").replay()
        end,
        ft = { "http", "rest" }, -- sets mapping for specified file types
      },
    },
    global_keymaps_prefix = "<leader>H",
    kulala_keymaps_prefix = "",
  },
}
