-- NOTE: Additional Filetypes
vim.filetype.add {
  extension = {
    ["templ"] = "templ",
    ["axaml"] = "xml",
  },
  pattern = {
    [".*/%.github[%w/]+workflows[%w/]+.*%.ya?ml"] = "yaml.github",
  },
}
