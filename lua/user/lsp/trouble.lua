local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
  return
end

trouble.setup {
  position = "bottom", -- position of the list can be: bottom, top, left, right
  height = 10, -- height of the trouble list when position is top or bottom
  width = 50, -- width of the list when position is left or right
  icons = true, -- use devicons for filenames
  mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
  auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
  use_diagnostic_signs = true,-- enabling this will use the signs defined in your lsp client
}
