-- NOTE: Additional Filetypes
vim.filetype.add {
  extension = {
    ["axaml"] = "xml",
  },
  pattern = {
    [".*/%.github[%w/]+workflows[%w/]+.*%.ya?ml"] = "yaml.github",
  },
}
