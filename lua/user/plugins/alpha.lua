local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
  [[]],
  [[]],
  [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
  [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
  [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
  [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
  [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
  [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
}
dashboard.section.buttons.val = {
  dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
  dashboard.button("c", "  Configuration", ":e $MYVIMRC<CR>"),
  dashboard.button("u", "  Sync plugins", ":PackerSync<CR> | PackerCompile<CR>"),
  dashboard.button("h", "  Neovim Check health", ":checkhealth<CR>"),
  dashboard.button("q", "  Quit Neovim", ":q!<CR>"),
}

local footer = function()
  local version = "   v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch

  -- Quote
  -- local fortune = require "alpha.fortune"
  -- local quote = table.concat(fortune(), "\n")

  local packer_plugins_status_ok, _ = pcall(require, "user.packer_compiled")
  if not packer_plugins_status_ok then
    return version
  end
  local total_plugins = "   " .. #vim.tbl_keys(packer_plugins) .. " Plugins"

  return version .. total_plugins
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Label"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
