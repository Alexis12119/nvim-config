-- NOTE: Git Blame
return {
  "f-person/git-blame.nvim",
  init = function()
    vim.keymap.set(
      "n",
      "<leader>gO",
      "<cmd>GitBlameOpenCommitURL<cr>",
      { desc = "GitBlame | Open Commit Url", silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>gc",
      "<cmd>GitBlameCopyCommitURL<cr>",
      { desc = "GitBlame | Copy Commit Url", silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>gf",
      "<cmd>GitBlameOpenFileURL<cr>",
      { desc = "GitBlame | Open File Url", silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>gC",
      "<cmd>GitBlameCopyFileURL<cr>",
      { desc = "GitBlame | Copy File Url", silent = true }
    )
    vim.keymap.set("n", "<leader>gs", "<cmd>GitBlameCopySHA<cr>", { desc = "GitBlame | Copy SHA", silent = true })
    vim.keymap.set("n", "<leader>gt", function()
      if vim.g.gitblame_enabled ~= true then
        vim.cmd "GitBlameEnable"
        vim.g.gitblame_enabled = true
      else
        vim.cmd "GitBlameDisable"
        vim.g.gitblame_enabled = false
      end
    end, { desc = "GitBlame | Toggle Blame", silent = true })
  end,
  cmd = {
    "GitBlameToggle",
    "GitBlameEnable",
    "GitBlameOpenCommitURL",
    "GitBlameCopyCommitURL",
    "GitBlameOpenFileURL",
    "GitBlameCopyFileURL",
    "GitBlameCopySHA",
  },
  opts = {},
}
