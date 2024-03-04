-- NOTE: Git Blame
return {
  "f-person/git-blame.nvim",
  init = function()
    require("core.utils").load_mappings "GitBlame"
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
