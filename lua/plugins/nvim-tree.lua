---@type NvPluginSpec
local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set("n", "l", api.node.open.edit, opts "Open")
  vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts "Up")
end

-- NOTE: File Explorer
return {
  "nvim-tree/nvim-tree.lua",
  init = function()
    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "NvimTree | Explorer", silent = true })
  end,
  cmd = {
    "NvimTreeOpen",
    "NvimTreeToggle",
    "NvimTreeFocus",
    "NvimTreeFindFile",
    "NvimTreeFindFileToggle",
  },
  opts = {
    on_attach = on_attach,
    diagnostics = {
      enable = false,
      icons = {
        hint = "󰌵",
        info = "",
        warning = "",
        error = "",
      },
    },
    sync_root_with_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {},
    },
    git = {
      enable = true,
      ignore = true,
      show_on_dirs = true,
      show_on_open_dirs = true,
      timeout = 5000,
    },
    view = {
      cursorline = false,
      float = {
        enable = false,
        quit_on_focus_loss = true,
        open_win_config = {
          relative = "editor",
          border = "rounded",
          width = 30,
          height = 30,
          row = 1,
          col = 1,
        },
      },
    },

    renderer = {
      highlight_git = false,
      -- root_folder_label = false,
      root_folder_label = ":~:s?$?",
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },

        glyphs = {
          default = "󰈚",
          symlink = "",
          folder = {
            default = "",
            empty = "",
            empty_open = "",
            open = "",
            symlink = "",
            symlink_open = "",
            arrow_open = "",
            arrow_closed = "",
          },

          git = {
            unstaged = "",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "U",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
  },
}
