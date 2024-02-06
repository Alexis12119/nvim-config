-- Show diffs
return {
  "sindrets/diffview.nvim",
  init = function()
    require("core.utils").load_mappings "Diffview"
  end,
  event = "User FilePost",
}
