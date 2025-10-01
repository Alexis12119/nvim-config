---@type NvPluginSpec
-- NOTE:  Opencode

return {
  "sudo-tee/opencode.nvim",
  event = "VeryLazy",
  opts = {
    ui = {
      input = {
        text = {
          wrap = true, -- Wraps text inside input window
        },
      },
    },
    keymap = {
      global = {
        toggle = "<leader>aa", -- Open opencode. Close if opened
        open_input = "<leader>ai", -- Opens and focuses on input window on insert mode
        open_input_new_session = "<leader>aI", -- Opens and focuses on input window on insert mode. Creates a new session
        open_output = "<leader>ao", -- Opens and focuses on output window
        toggle_focus = "<leader>at", -- Toggle focus between opencode and last window
        close = "<leader>aq", -- Close UI windows
        select_session = "<leader>as", -- Select and load a opencode session
        configure_provider = "<leader>ap", -- Quick provider and model switch from predefined list
        diff_open = "<leader>ad", -- Opens a diff tab of a modified file since the last opencode prompt
        diff_next = "<leader>a]", -- Navigate to next file diff
        diff_prev = "<leader>a[", -- Navigate to previous file diff
        diff_close = "<leader>ac", -- Close diff view tab and return to normal editing
        diff_revert_all_last_prompt = "<leader>ara", -- Revert all file changes since the last opencode prompt
        diff_revert_this_last_prompt = "<leader>art", -- Revert current file changes since the last opencode prompt
        diff_revert_all = "<leader>arA", -- Revert all file changes since the last opencode session
        diff_revert_this = "<leader>arT", -- Revert current file changes since the last opencode session
        swap_position = "<leader>ax", -- Swap Opencode pane left/right
      },
    },
  },
}
