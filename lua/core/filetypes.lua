-- NOTE: Additional Filetypes
vim.filetype.add {
  extension = {
    ["templ"] = "templ",
  },
  pattern = {
    [".*%.github/workflows/.*%.yml"] = "yaml.ghaction",
    [".*%.github/workflows/.*%.yaml"] = "yaml.ghaction",
  },
}
