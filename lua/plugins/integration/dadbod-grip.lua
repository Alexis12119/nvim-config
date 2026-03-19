---@type LazySpec
-- NOTE: Database Grip
return {
  {
    "joryeugene/dadbod-grip.nvim",
    version = "*",
    opts = {
      completion = false,
      keymaps = { qpad_execute = "<CR>" }, -- or whatever key you prefer
    },
    keys = {
      { "<leader>D", false },
      {
        "<leader>D",
        "<cmd>GripConnect<cr>",
        desc = "DBGrip: Connect",
        silent = true,
      },
    },
  },
}
