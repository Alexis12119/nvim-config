---@type NvPluginSpec
return {
  "mg979/vim-visual-multi",
  event = "User FilePost",
  init = function(_)
    vim.g.VM_mouse_mappings = 1
    vim.g.VM_maps = {
      ["Add Cursor Up"] = "<C-PageUp>", -- <C-Up> is for resize windows
      ["Add Cursor Down"] = "<C-PageDown>", -- <C-Down> is for resize windows
    }
  end,
}
