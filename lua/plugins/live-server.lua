-- NOTE: If you face the permission issue, read this https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally
return {
  "barrett-ruth/live-server.nvim",
  build = "npm add -g live-server",
  cmd = {
    "LiveServerStart",
    "LiveServerStop",
  },
  init = function()
    local toggle_state = (function()
      local state = true
      return function()
        state = not state
        return state
      end
    end)()
    vim.keymap.set("n", "<leader>uL", function()
      if toggle_state() then
        vim.cmd "LiveServerStart"
      else
        vim.cmd "LiveServerStop"
      end
    end, { desc = "LiveServer | Toggle", silent = true })
  end,
  config = true,
}
