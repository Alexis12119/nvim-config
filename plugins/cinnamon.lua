-- NOTE: Smooth scrolling with Cinnamon
return {
  "declancm/cinnamon.nvim",
  event = "User FilePost",
  opts = {
    -- KEYMAPS:
    default_keymaps = true, -- Create default keymaps.
    extra_keymaps = false, -- Create extra keymaps.
    extended_keymaps = false, -- Create extended keymaps.
    override_keymaps = false, -- The plugin keymaps will override any existing keymaps.
    scroll_limit = -1,
  },
}
