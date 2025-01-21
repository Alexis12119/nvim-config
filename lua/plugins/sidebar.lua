---@type NvPluginSpec
-- NOTE: Sidebar
return {
  "sidebar-nvim/sidebar.nvim",
  cond = false,
  cmd = {
    "SidebarNvimToggle",
    "SidebarNvimOpen",
    "SidebarNvimFocus",
    "SidebarNvimUpdate",
  },
  opts = {
    disable_default_keybindings = 0,
    bindings = nil,
    open = false,
    side = "left",
    initial_width = 32,
    hide_statusline = false,
    update_interval = 100,
    sections = { "git", "containers" },
    section_separator = { "", "-----", "" },
    section_title_separator = { "" },
    containers = {
      attach_shell = "/bin/sh",
      show_all = true,
      interval = 5000,
    },
    -- datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
    todos = { ignored_paths = { "~" } },
    ["git"] = {
      icon = "",
    },
  },
}
