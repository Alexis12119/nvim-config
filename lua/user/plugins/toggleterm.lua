local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup {
  size = 20,
  shading_factor = 2,
  direction = "float",
  highlights = {
    NormalFloat = {
      guibg = "#202328",
    },
    FloatBorder = {
      guifg = "#51afef",
    },
  },
  float_opts = {
    border = "curved",
    winblend = 0,
  },
}

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new { cmd = "lazygit", hidden = true }

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end
