---@type LazySpec
-- NOTE: Collaboration
return {
  "nomad/nomad",
  version = "*",
  enabled = not vim.g.is_windows,
  cmd = "Mad",
  build = function()
    ---@type nomad.neovim.build
    local build = require("nomad.neovim.build")

    build.builders.download_prebuilt():build(build.contexts.lazy())
  end,
  opts = {},
}
