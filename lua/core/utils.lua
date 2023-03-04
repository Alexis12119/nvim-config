local command = vim.api.nvim_create_user_command

function _G.reload_core()
  for name, _ in pairs(package.loaded) do
    if name:match "^core" then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)

  -- For plugin reload but currently not working.
  -- local plugins = require("lazy.core.config").plugins
  -- for plugin, _ in pairs(plugins) do
  --   require("lazy.core.loader").reload(plugins[plugin])
  -- end
end

function _G.format_code()
  return vim.lsp.buf.format {
    async = true,
    filter = function(client)
      return client.name == "null-ls"
    end,
  }
end

function _G.set_keymaps(keymaps, mode)
  local opt = { silent = true }

  if mode == "c" then
    opt = { expr = true }
  end

  for keymap, value in pairs(keymaps) do
    if value.desc ~= nil then
      opt = vim.tbl_extend("force", opt, { desc = value.desc })
      vim.keymap.set(mode, keymap, value.cmd, opt)
    else
      vim.keymap.set(mode, keymap, value.cmd, opt)
    end
  end
end

function _G.set_option(options)
  for name, value in pairs(options) do
    vim.opt[name] = value
  end
end

function _G.set_global(globals)
  for name, value in pairs(globals) do
    vim.g[name] = value
  end
end

function _G.update_config()
  local args = "git -C " .. vim.fn.stdpath "config" .. " pull --ff-only"
  vim.fn.system(args)
end

function _G.list_registered_providers_names(filetype)
  local s = require "null-ls.sources"
  local available_sources = s.get_available(filetype)
  local registered = {}
  for _, source in ipairs(available_sources) do
    for method in pairs(source.methods) do
      registered[method] = registered[method] or {}
      table.insert(registered[method], source.name)
    end
  end
  return registered
end

function _G.list_registered_formatters(filetype)
  local registered_providers = list_registered_providers_names(filetype)
  local method = require("null-ls").methods.FORMATTING
  return registered_providers[method] or {}
end

function _G.list_registered_linters(filetype)
  local registered_providers = list_registered_providers_names(filetype)
  local method = require("null-ls").methods.DIAGNOSTICS
  return registered_providers[method] or {}
end

command("Format", function()
  format_code()
  vim.notify("Format Done", vim.log.levels.INFO, { title = "Format" })
end, { nargs = "*" })

command("Reload", function()
  if vim.bo.buftype == "" then
    reload_core()
    vim.notify("Core Reload Done", vim.log.levels.INFO, { title = "Configuration Reload" })
  else
    vim.notify("Not available in this window/buffer", vim.log.levels.INFO, { title = "Configuration Reload" })
  end
end, { nargs = "*" })

command("Update", function()
  update_config()
  vim.notify("Update Done", vim.log.levels.INFO, { title = "Configuration Update" })
end, { nargs = "*" })

command("LuaSnipEdit", function()
  require("luasnip.loaders").edit_snippet_files()
end, { nargs = "*" })
