---@type NvPluginSpec
-- NOTE: QoL Plugins

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    indent = {
      enabled = true,
      scope = {
        enabled = false,
      },
    },
    input = { enabled = false },
    picker = { enabled = true },
    notifier = { enabled = false },
    quickfile = { enabled = true },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    image = {
      enabled = true,
      convert = {
        notify = false,
      },
    },
  },
  init = function()
    -- Snacks replacements for old Telescope mappings
    --
    -- -- Find
    -- vim.keymap.set("n", "<leader>ff", function()
    --   Snacks.picker.files()
    -- end, { desc = "Snacks | Find Files", silent = true })
    -- vim.keymap.set("n", "<leader>fg", function()
    --   Snacks.picker.git_files()
    -- end, { desc = "Snacks | Git Files", silent = true })
    -- vim.keymap.set("n", "<leader>fr", function()
    --   Snacks.picker.recent()
    -- end, { desc = "Snacks | Recent Files", silent = true })
    -- vim.keymap.set("n", "<leader>fb", function()
    --   Snacks.picker.buffers()
    -- end, { desc = "Snacks | Buffers", silent = true })
    -- vim.keymap.set("n", "<leader>fp", function()
    --   Snacks.picker.projects()
    -- end, { desc = "Snacks | Projects", silent = true })
    --
    -- -- Grep / Search
    -- vim.keymap.set("n", "<leader>fw", function()
    --   Snacks.picker.grep()
    -- end, { desc = "Snacks | Grep Word", silent = true })
    -- vim.keymap.set("n", "<leader>fh", function()
    --   Snacks.picker.help()
    -- end, { desc = "Snacks | Help", silent = true })
    -- vim.keymap.set("n", "<leader>fk", function()
    --   Snacks.picker.keymaps()
    -- end, { desc = "Snacks | Keymaps", silent = true })
    -- vim.keymap.set("n", "<leader>fC", function()
    --   Snacks.picker.commands()
    -- end, { desc = "Snacks | Commands", silent = true })
    -- vim.keymap.set("n", "<leader>fH", function()
    --   Snacks.picker.highlights()
    -- end, { desc = "Snacks | Highlights", silent = true })
    -- vim.keymap.set("n", "<leader>fm", function()
    --   Snacks.picker.marks()
    -- end, { desc = "Snacks | Marks", silent = true })
    -- vim.keymap.set("n", "<leader>fM", function()
    --   Snacks.picker.man()
    -- end, { desc = "Snacks | Man Pages", silent = true })
    -- vim.keymap.set("n", "<leader>fb", function()
    --   Snacks.picker.resume()
    -- end, { desc = "Snacks | Resume", silent = true })
    -- vim.keymap.set("n", "<leader>fu", function()
    --   Snacks.picker.undo()
    -- end, { desc = "Snacks | Undo History", silent = true })
    --
    -- -- Git
    -- vim.keymap.set("n", "<leader>gb", function()
    --   Snacks.picker.git_branches()
    -- end, { desc = "Snacks | Git Branches", silent = true })
    -- vim.keymap.set("n", "<leader>gc", function()
    --   Snacks.picker.git_log()
    -- end, { desc = "Snacks | Git Commits", silent = true })
    --
    -- -- LSP
    -- vim.keymap.set("n", "<leader>ls", function()
    --   Snacks.picker.lsp_symbols()
    -- end, { desc = "Snacks | Buffer Symbols", silent = true })
    -- vim.keymap.set("n", "<leader>lS", function()
    --   Snacks.picker.lsp_workspace_symbols()
    -- end, { desc = "Snacks | Workspace Symbols", silent = true })

    -- -- Notifications
    -- vim.keymap.set("n", "<leader>fn", function()
    --   Snacks.picker.notifications()
    -- end, { desc = "Snacks | Notification History", silent = true })

    -- Buffers / Scratch
    vim.keymap.set("n", "<leader>c", function()
      Snacks.bufdelete()
    end, { desc = "Snacks | Close Buffer", silent = true })

    vim.keymap.set("n", "<leader>w", function()
      if vim.bo.buftype == "terminal" then
        Snacks.bufdelete()
        vim.cmd "silent! close"
      elseif #vim.api.nvim_list_wins() > 1 then
        vim.cmd "silent! close"
      else
        vim.notify("Can't Close Window", vim.log.levels.WARN, { title = "Close Window" })
      end
    end, { desc = "Snacks | Close window", silent = true })

    vim.keymap.set("n", "<leader>ns", function()
      Snacks.scratch()
    end, { desc = "Snacks | Toggle Scratch", silent = true })
  end,
}
