-- NOTE: Additional Filetypes
vim.filetype.add {
  extension = {
    ["templ"] = "templ",
    ["json"] = "jsonc",
  },
  pattern = {
    [".*/.github/workflows/.*%.yml"] = "yaml.ghaction",
    [".*/.github/workflows/.*%.yaml"] = "yaml.ghaction",
  },
    pattern = {
    [".*/.github/workflows/.*%.yml"] = "yaml.ghaction",
    [".*/.github/workflows/.*%.yaml"] = "yaml.ghaction",
  },
}
