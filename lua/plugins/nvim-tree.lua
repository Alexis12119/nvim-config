return {
  "nvim-tree/nvim-tree.lua",
  module = true,
  cmd = {
    "NvimTreeOpen",
    "NvimTreeToggle",
    "NvimTreeFocus",
    "NvimTreeFindFile",
    "NvimTreeFindFileToggle",
  },
  dependencies = {
    {
      "nvim-tree/nvim-web-devicons",
      config = function()
        local icons = require "nvim-web-devicons"

        icons.set_icon {
          deb = { icon = "", name = "Deb", color = "#A1B7EE" },
          lock = { icon = "", name = "Lock", color = "#C4C720" },
          mp3 = { icon = "", name = "Mp3", color = "#D39EDE" },
          mp4 = { icon = "", name = "Mp4", color = "#9EA3DE" },
          out = { icon = "", name = "Out", color = "#ABB2BF" },
          ["robots.txt"] = { icon = "ﮧ", name = "Robots", "#ABB2BF" },
          [""] = { icon = "", name = "default", "#ABB2Bf" },
          ttf = { icon = "", name = "TrueTypeFont", "#ABB2Bf" },
          rpm = { icon = "", name = "Rpm", "#FCA2Aa" },
          woff = { icon = "", name = "WebOpenFontFormat", color = "#ABB2Bf" },
          woff2 = { icon = "", name = "WebOpenFontFormat2", color = "#ABB2Bf" },
          xz = { icon = "", name = "Xz", color = "#519ABa" },
          zip = { icon = "", name = "Zip", color = "#F9D71c" },
          snippets = { icon = "", name = "Snippets", color = "#51AFEf" },
          ahk = { icon = "", name = "AutoHotkey", color = "#51AFEf" },
        }
      end,
    },
  },
  config = function()
    local nvim_tree = require "nvim-tree"
    local nvim_tree_config = require "nvim-tree.config"
    local tree_cb = nvim_tree_config.nvim_tree_callback

    nvim_tree.setup {
      disable_netrw = false,
      auto_reload_on_write = false,
      diagnostics = {
        enable = false,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
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
        timeout = 3000,
      },
      renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        full_name = false,
        highlight_opened_files = "none",
        highlight_modified = "none",
        root_folder_label = ":~:s?$?/..?",
        indent_width = 2,
        indent_markers = {
          enable = true,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },

        icons = {
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
            },
            git = {
              unstaged = "",
              staged = "S",
              unmerged = "",
              renamed = "➜",
              deleted = "",
              untracked = "U",
              ignored = "◌",
            },
          },
        },
      },
      actions = {
        use_system_clipboard = true,
        change_dir = {
          enable = false,
          global = false,
          restrict_above_cwd = false,
        },
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
        hide_root_folder = false,
        mappings = {
          custom_only = false,
          list = {
            { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
            { key = "h", cb = tree_cb "close_node" },
            { key = "v", cb = tree_cb "vsplit" },
            { key = "s", cb = tree_cb "split" },
            { key = "u", action = "dir_up" },
          },
        },
      },
    }
  end,
}
