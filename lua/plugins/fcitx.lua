---@type NvPluginSpec
return {
  {
    "alohaia/fcitx.nvim",
    cond = false and (vim.fn.executable "fcitx5" == 1 or vim.fn.executable "fcitx" == 1),
    event = "User FilePost",
    opts = {},
    config = function(_, opts)
      require "fcitx"(opts)
    end,
  },
}
