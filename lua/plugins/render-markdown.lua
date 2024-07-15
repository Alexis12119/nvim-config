return {
  "MeanderingProgrammer/markdown.nvim",
  name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- Mandatory
    "nvim-tree/nvim-web-devicons", -- Optional but recommended
  },
  cmd = {
    "RenderMarkdownToggle",
  },
  init = function()
    vim.keymap.set("n", "<leader>mr", function()
      if vim.bo.filetype == "markdown" then
        vim.cmd "RenderMarkdownToggle"
      else
        vim.notify("Only available in markdown", vim.log.levels.WARN, { title = "Markdown-Render" })
      end
    end, { desc = "Markdown | Toggle Render", silent = true })
  end,
  opts = {
    enabled = false,
  },
  config = function(_, opts)
    require("render-markdown").setup(opts)
  end,
  ft = "markdown",
}
