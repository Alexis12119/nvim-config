---@type LazySpec
-- NOTE: Graphical File Icons
return {
  "Mirsmog/real-icons.nvim",
  build = ":RealIconsInstallPack material",
  opts = {
    pack = "material",
    integrations = {
      telescope = true,
      fzf_lua = true,
      neo_tree = true,
      nvim_tree = true,
      snacks_picker = true,
      oil = true,
      lualine = true,
      bufferline = true,
    },
  },
}
