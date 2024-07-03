-- NOTE: AI Autocomplete
return {
  "supermaven-inc/supermaven-nvim",
  event = "User FilePost",
  opts = {
    -- disable_keymaps = true,
    keymaps = {
      accept_suggestion = "<C-y>",
      clear_suggestion = "<C-]>",
      accept_word = "<C-j>",
    },
  },
}
