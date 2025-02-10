---@type NvPluginSpec
-- NOTE: Git Blame
return {
  "f-person/git-blame.nvim",
  keys = {
    {
      "<leader>gO",
      "<cmd>GitBlameOpenCommitURL<cr>",
      desc = "GitBlame | Open Commit Url",
      silent = true,
    },
    {
      "<leader>gc",
      "<cmd>GitBlameCopyCommitURL<cr>",
      desc = "GitBlame | Copy Commit Url",
      silent = true,
    },
    {
      "<leader>gf",
      "<cmd>GitBlameOpenFileURL<cr>",
      desc = "GitBlame | Open File Url",
      silent = true,
    },
    {
      "<leader>gC",
      "<cmd>GitBlameCopyFileURL<cr>",
      desc = "GitBlame | Copy File Url",
      silent = true,
    },
    {
      "<leader>gs",
      "<cmd>GitBlameCopySHA<cr>",
      desc = "GitBlame | Copy SHA",
      silent = true,
    },
    {
      "<leader>gt",
      "<cmd>GitBlameToggle<cr>",
      desc = "GitBlame | Toggle Blame",
      silent = true,
    },
  },
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
