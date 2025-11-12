-- NOTE: Additional Filetypes
vim.filetype.add({
  extension = {
    ["axaml"] = "xml",
    ["jinja"] = "htmldjango",
  },
  pattern = {
    [".*/%.github[%w/]+workflows[%w/]+.*%.ya?ml"] = "yaml.github",
  },
})
