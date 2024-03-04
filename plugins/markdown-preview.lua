-- NOTE: Preview Markdown
return {
  "iamcco/markdown-preview.nvim",
  init = function()
    require("core.utils").load_mappings "MarkdownPreview"
  end,
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  ft = "markdown",
}
