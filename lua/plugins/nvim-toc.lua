return {
  "richardbizik/nvim-toc",
  init = function()
    vim.keymap.set("n", "<leader>ml", function()
      if vim.bo.filetype == "markdown" then
        vim.cmd "TOCList"
      else
        vim.notify("Only available in markdown", vim.log.levels.WARN, { title = "Markdown-TOC" })
      end
    end, { desc = "Markdown | TOC List", silent = true })
    vim.keymap.set("n", "<leader>mn", function()
      if vim.bo.filetype == "markdown" then
        vim.cmd "TOC"
      else
        vim.notify("Only available in markdown", vim.log.levels.WARN, { title = "Markdown-TOC" })
      end
    end, { desc = "Markdown | TOC Numbered", silent = true })
  end,
  opts = {
    toc_header = "TABLE OF CONTENTS",
  },
  config = function(_, opts)
    require("nvim-toc").setup(opts)
  end,
  ft = "markdown",
}
