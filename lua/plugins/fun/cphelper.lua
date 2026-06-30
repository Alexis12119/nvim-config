---@type LazySpec
-- NOTE: Competitive Programming
return {
  "p00f/cphelper.nvim",
  event = "VeryLazy",
  config = function()
    vim.g["cph#lang"] = "java"
  end,
}
