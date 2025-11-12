---@type LazySpec
-- NOTE: Opencode
return {
  "sudo-tee/opencode.nvim",
  enabled = false,
  event = "VeryLazy",
  opts = {
    ui = {
      input = {
        text = {
          wrap = true, -- Wraps text inside input window
        },
      },
    },
    keymap_prefix = "<leader>a",
    keymap = {
      editor = {
        ["<leader>aa"] = { "toggle" }, -- Open opencode. Close if opened
      },
    },
  },
}
