-- NOTE: Additional Filetypes
vim.filetype.add {
  extension = {
    ["templ"] = "templ",
    ["json"] = "jsonc",
  },
  pattern = {
    [".*%.github/workflows/.*%.yml"] = "yaml.ghaction",
    [".*%.github/workflows/.*%.yaml"] = "yaml.ghaction",
    [".*"] = {
      function(path, buf)
        return vim.bo[buf]
            and vim.bo[buf].filetype ~= "bigfile"
            and path
            and vim.g.bigfile_size
            and vim.fn.getfsize(path) > vim.g.bigfile_size
            and "bigfile"
          or nil
      end,
    },
  },
}
