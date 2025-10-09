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
    keymap_prefix = "<leader>a",
    keymap = {
      editor = {
        ["<leader>ag"] = { "toggle" }, -- Open opencode. Close if opened
        ["<leader>ai"] = { "open_input" }, -- Opens and focuses on input window on insert mode
        ["<leader>aI"] = { "open_input_new_session" }, -- Opens and focuses on input window on insert mode. Creates a new session
        ["<leader>ao"] = { "open_output" }, -- Opens and focuses on output window
        ["<leader>at"] = { "toggle_focus" }, -- Toggle focus between opencode and last window
        ["<leader>aq"] = { "close" }, -- Close UI windows
        ["<leader>as"] = { "select_session" }, -- Select and load a opencode session
        ["<leader>ap"] = { "configure_provider" }, -- Quick provider and model switch from predefined list
        ["<leader>ad"] = { "diff_open" }, -- Opens a diff tab of a modified file since the last opencode prompt
        ["<leader>a]"] = { "diff_next" }, -- Navigate to next file diff
        ["<leader>a["] = { "diff_prev" }, -- Navigate to previous file diff
        ["<leader>ac"] = { "diff_close" }, -- Close diff view tab and return to normal editing
        ["<leader>ara"] = { "diff_revert_all_last_prompt" }, -- Revert all file changes since the last opencode prompt
        ["<leader>art"] = { "diff_revert_this_last_prompt" }, -- Revert current file changes since the last opencode prompt
        ["<leader>arA"] = { "diff_revert_all" }, -- Revert all file changes since the last opencode session
        ["<leader>arT"] = { "diff_revert_this" }, -- Revert current file changes since the last opencode session
        ["<leader>arr"] = { "diff_restore_snapshot_file" }, -- Restore a file to a restore point
        ["<leader>arR"] = { "diff_restore_snapshot_all" }, -- Restore all files to a restore point
        ["<leader>ax"] = { "swap_position" }, -- Swap Opencode pane left/right
        ["<leader>apa"] = { "permission_accept" }, -- Accept permission request once
        ["<leader>apA"] = { "permission_accept_all" }, -- Accept all (for current tool)
        ["<leader>apd"] = { "permission_deny" }, -- Deny permission request once
      },
      input_window = {
        ["<cr>"] = { "submit_input_prompt", mode = { "n", "i" } }, -- Submit prompt (normal mode and insert mode)
        ["<esc>"] = { "close" }, -- Close UI windows
        ["<C-c>"] = { "stop" }, -- Stop opencode while it is running
        ["~"] = { "mention_file", mode = "i" }, -- Pick a file and add to context. See File Mentions section
        ["@"] = { "mention", mode = "i" }, -- Insert mention (file/agent)
        ["/"] = { "slash_commands", mode = "i" }, -- Pick a command to run in the input window
        ["<tab>"] = { "toggle_pane", mode = { "n", "i" } }, -- Toggle between input and output panes
        ["<up>"] = { "prev_prompt_history", mode = { "n", "i" } }, -- Navigate to previous prompt in history
        ["<down>"] = { "next_prompt_history", mode = { "n", "i" } }, -- Navigate to next prompt in history
        ["<M-m>"] = { "switch_mode" }, -- Switch between modes (build/plan)
      },
      output_window = {
        ["<esc>"] = { "close" }, -- Close UI windows
        ["<C-c>"] = { "stop" }, -- Stop opencode while it is running
        ["]]"] = { "next_message" }, -- Navigate to next message in the conversation
        ["[["] = { "prev_message" }, -- Navigate to previous message in the conversation
        ["<tab>"] = { "toggle_pane", mode = { "n", "i" } }, -- Toggle between input and output panes
        ["<C-i>"] = { "focus_input" }, -- Focus on input window and enter insert mode at the end of the input from the output window
        ["<leader>aS"] = { "select_child_session" }, -- Select and load a child session
        ["<leader>aD"] = { "debug_message" }, -- Open raw message in new buffer for debugging
        ["<leader>aO"] = { "debug_output" }, -- Open raw output in new buffer for debugging
        ["<leader>ads"] = { "debug_session" }, -- Open raw session in new buffer for debugging
      },
    },
  },
}
