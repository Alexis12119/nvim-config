local alpha = require "alpha"
local startify = require "alpha.themes.startify"

local headers = {
  nvim = {
    "                                                     ",
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  },
  hydra = {
    "                                   ",
    "                                   ",
    "                                   ",
    "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
    "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
    "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
    "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
    "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
    "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
    "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
    " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
    " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
    "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
    "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
    "                                   ",
  },
  arch = {
    "                         ▄                          ",
    "                        ▟█▙                         ",
    "                       ▟███▙                        ",
    "                      ▟█████▙                       ",
    "                     ▟███████▙                      ",
    "                    ▂▔▀▜██████▙                     ",
    "                   ▟██▅▂▝▜█████▙                    ",
    "                  ▟█████████████▙                   ",
    "                 ▟███████████████▙                  ",
    "                ▟█████████████████▙                 ",
    "               ▟███████████████████▙                ",
    "              ▟█████████▛▀▀▜████████▙               ",
    "             ▟████████▛      ▜███████▙              ",
    "            ▟█████████        ████████▙             ",
    "           ▟██████████        █████▆▅▄▃             ",
    "          ▟██████████▛        ▜█████████▙           ",
    "         ▟██████▀▀▀              ▀▀██████▙          ",
    "        ▟███▀▘                       ▝▀███▙         ",
    "       ▟▛▀                               ▀▜▙        ",
  },
  pacman = {
    "                                                                              ",
    "                                                                              ",
    "                                                                              ",
    "                                                                              ",
    "                                    ██████                                    ",
    "                                ████▒▒▒▒▒▒████                                ",
    "                              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                              ",
    "                            ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                            ",
    "                          ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒                              ",
    "                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓                          ",
    "                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓                          ",
    "                        ██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██                        ",
    "                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ",
    "                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ",
    "                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ",
    "                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ",
    "                        ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██                        ",
    "                        ████  ██▒▒██  ██▒▒▒▒██  ██▒▒██                        ",
    "                        ██      ██      ████      ████                        ",
  },
}

startify.section.header.val = headers.nvim
startify.section.header.opts.hl = "AlphaHeader"

startify.section.top_buttons.val = {
  startify.button("SPC f f", "  Find File"),
  startify.button("SPC f r", "󱔗  Recent Files"),
  startify.button("SPC f t", "󰈭  Find Text"),
  startify.button("SPC f p", "  Find Projects"),
  startify.button("SPC n c", "  Configuration", ":e $MYVIMRC<cr>"),
  -- startify.button("SPC p u", "  Update Plugins"),
  startify.button("SPC q", "    Quit Neovim"),
}
-- disable MRU
startify.section.mru.val = { { type = "padding", val = 0 } }
-- disable MRU cwd
startify.section.mru_cwd.val = { { type = "padding", val = 0 } }
-- disable nvim_web_devicons
startify.nvim_web_devicons.enabled = true
-- startify.nvim_web_devicons.highlight = false
-- startify.nvim_web_devicons.highlight = 'Keyword'
--
startify.section.bottom_buttons.val = {}

local footer = function()
  local version = " " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
  local lazy_ok, lazy = pcall(require, "lazy")
  if lazy_ok then
    local total_plugins = lazy.stats().count .. " Plugins"
    local startuptime = (math.floor(lazy.stats().startuptime * 100 + 0.5) / 100)
    return version .. "   " .. total_plugins .. "  󰄉 " .. startuptime .. " ms"
  else
    return version
  end
end

for _, button in pairs(startify.section.top_buttons.val) do
  button.opts.hl = "AlphaButton"
  button.opts.hl_shortcut = "AlphaShortcut"
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    startify.section.footer.val = {
      { type = "text", val = footer },
    }
    vim.cmd "AlphaRedraw"
  end,
  desc = "Footer for Alpha",
})
-- ignore filetypes in MRU

local default_mru_ignore = { "gitcommit" }

startify.mru_opts.ignore = function(path, ext)
  return (string.find(path, "COMMIT_EDITMSG")) or (vim.tbl_contains(default_mru_ignore, ext))
end
alpha.setup(startify.config)
