local command = vim.api.nvim_create_user_command

function _G.reload_core()
  for name, _ in pairs(package.loaded) do
    if name:match "^core" then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
end

function _G.format_code()
  return vim.lsp.buf.format {
    async = true,
    filter = function(client)
      local have_nls = package.loaded["null-ls"]
        and (
          #require("null-ls.sources").get_available(
            vim.bo[vim.api.nvim_get_current_buf()].filetype,
            "NULL_LS_FORMATTING"
          ) > 0
        )

      if have_nls then
        return client.name == "null-ls"
      else
        return client.name ~= "null-ls"
      end
    end,
  }
end

function _G.set_keymaps(keymaps, mode)
  for keymap, value in pairs(keymaps) do
    if value.opt ~= nil then
      vim.keymap.set(mode, keymap, value.cmd, value.opt, { desc = value.desc or "" })
    else
      local opt = { silent = true }

      if mode == "c" then
        opt = { expr = true }
      end

      vim.keymap.set(mode, keymap, value.cmd, opt, { desc = value.desc or "" })
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
end, { nargs = "*", desc = "Code Format" })

command("Reload", function()
  if vim.bo.buftype == "" then
    reload_core()
    vim.notify("Core Reload Done", vim.log.levels.INFO, { title = "Core Reload" })
  else
    vim.notify("Not available in this window/buffer", vim.log.levels.INFO, { title = "Configuration Reload" })
  end
end, { nargs = "*", desc = "Core Reload" })

command("Update", function()
  update_config()
  vim.notify("Update Done", vim.log.levels.INFO, { title = "Config Update" })
end, { nargs = "*", desc = "Configuration Update" })

command("LuaSnipEdit", function()
  require("luasnip.loaders").edit_snippet_files()
end, { nargs = "*", desc = "Edit the available snippets in the filetype" })

function _G.which_key_add(mappings, mode)
  local which_key = require "which-key"

  local setup = {
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    key_labels = {
      -- override the label used to display some keys. It doesn't effect WK in any other way.
      -- For example:
      -- ["<space>"] = "SPC",
      -- ["<cr>"] = "RET",
      -- ["<tab>"] = "TAB",
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
      border = "rounded", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
      padding = { 2, 0, 2, 0 }, -- extra window padding [top, right, bottom, left]
      winblend = 0,
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
    ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", ":", "<Cmd>", "<cr>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
      -- list of mode / prefixes that should never be hooked by WhichKey
      -- this is mostly relevant for key maps that start with a native binding
      -- most people should not need to change this
      i = { "j", "k" },
      v = { "j", "k" },
    },
  }

  local opts = {
    mode = mode, -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }

  which_key.setup(setup)
  which_key.register(mappings, opts)
end
