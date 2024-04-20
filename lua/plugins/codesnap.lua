return {
  "mistricky/codesnap.nvim",
  enabled = false and vim.fn.has "win32" == 0,
  build = "make",
  -- build = "make build_generator",
  version = "^1",
  opts = {
    mac_window_bar = true,
    title = "",
    code_font_family = "JetbrainsMono Nerd Font Mono",
    watermark_font_family = "JetbrainsMono Nerd Font Mono",
    watermark = "",
    bg_theme = "summer",
  },
}
