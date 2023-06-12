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
  config = function()
    local function on_attach(bufnr)
      local api = require "nvim-tree.api"

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts "CD")
      vim.keymap.set("n", "<C-e>", api.node.open.replace_tree_buffer, opts "Open: In Place")
      vim.keymap.set("n", "<C-k>", api.node.show_info_popup, opts "Info")
      vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts "Rename: Omit Filename")
      vim.keymap.set("n", "<C-t>", api.node.open.tab, opts "Open: New Tab")
      vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts "Open: Vertical Split")
      vim.keymap.set("n", "v", api.node.open.vertical, opts "Open: Vertical Split")
      vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts "Open: Horizontal Split")
      vim.keymap.set("n", "s", api.node.open.horizontal, opts "Open: Horizontal Split")
      vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts "Close Directory")
      vim.keymap.set("n", "<CR>", api.node.open.edit, opts "Open")
      vim.keymap.set("n", "<Tab>", api.node.open.preview, opts "Open Preview")
      vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts "Next Sibling")
      vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts "Previous Sibling")
      vim.keymap.set("n", ".", api.node.run.cmd, opts "Run Command")
      vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts "Up")
      vim.keymap.set("n", "a", api.fs.create, opts "Create")
      vim.keymap.set("n", "bmv", api.marks.bulk.move, opts "Move Bookmarked")
      vim.keymap.set("n", "B", api.tree.toggle_no_buffer_filter, opts "Toggle No Buffer")
      vim.keymap.set("n", "c", api.fs.copy.node, opts "Copy")
      vim.keymap.set("n", "C", api.tree.toggle_git_clean_filter, opts "Toggle Git Clean")
      vim.keymap.set("n", "[c", api.node.navigate.git.prev, opts "Prev Git")
      vim.keymap.set("n", "]c", api.node.navigate.git.next, opts "Next Git")
      vim.keymap.set("n", "d", api.fs.remove, opts "Delete")
      vim.keymap.set("n", "D", api.fs.trash, opts "Trash")
      vim.keymap.set("n", "E", api.tree.expand_all, opts "Expand All")
      vim.keymap.set("n", "e", api.fs.rename_basename, opts "Rename: Basename")
      vim.keymap.set("n", "]e", api.node.navigate.diagnostics.next, opts "Next Diagnostic")
      vim.keymap.set("n", "[e", api.node.navigate.diagnostics.prev, opts "Prev Diagnostic")
      vim.keymap.set("n", "F", api.live_filter.clear, opts "Clean Filter")
      vim.keymap.set("n", "f", api.live_filter.start, opts "Filter")
      vim.keymap.set("n", "g?", api.tree.toggle_help, opts "Help")
      vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts "Copy Absolute Path")
      vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts "Toggle Dotfiles")
      vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts "Toggle Git Ignore")
      vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts "Last Sibling")
      vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts "First Sibling")
      vim.keymap.set("n", "m", api.marks.toggle, opts "Toggle Bookmark")
      vim.keymap.set("n", "o", api.node.open.edit, opts "Open")
      vim.keymap.set("n", "l", api.node.open.edit, opts "Open")
      vim.keymap.set("n", "O", api.node.open.no_window_picker, opts "Open: No Window Picker")
      vim.keymap.set("n", "p", api.fs.paste, opts "Paste")
      vim.keymap.set("n", "P", api.node.navigate.parent, opts "Parent Directory")
      vim.keymap.set("n", "q", api.tree.close, opts "Close")
      vim.keymap.set("n", "r", api.fs.rename, opts "Rename")
      vim.keymap.set("n", "R", api.tree.reload, opts "Refresh")
      vim.keymap.set("n", "s", api.node.run.system, opts "Run System")
      vim.keymap.set("n", "S", api.tree.search_node, opts "Search")
      vim.keymap.set("n", "U", api.tree.toggle_custom_filter, opts "Toggle Hidden")
      vim.keymap.set("n", "W", api.tree.collapse_all, opts "Collapse")
      vim.keymap.set("n", "x", api.fs.cut, opts "Cut")
      vim.keymap.set("n", "y", api.fs.copy.filename, opts "Copy Name")
      vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts "Copy Relative Path")
      vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts "Open")
      vim.keymap.set("n", "<2-RightMouse>", api.tree.change_root_to_node, opts "CD")
      vim.keymap.set("n", "O", "", { buffer = bufnr })
      vim.keymap.del("n", "O", { buffer = bufnr })
      vim.keymap.set("n", "<2-RightMouse>", "", { buffer = bufnr })
      vim.keymap.del("n", "<2-RightMouse>", { buffer = bufnr })
      vim.keymap.set("n", "D", "", { buffer = bufnr })
      vim.keymap.del("n", "D", { buffer = bufnr })
      vim.keymap.set("n", "E", "", { buffer = bufnr })
      vim.keymap.del("n", "E", { buffer = bufnr })

      vim.keymap.set("n", "A", api.tree.expand_all, opts "Expand All")
      vim.keymap.set("n", "?", api.tree.toggle_help, opts "Help")
      vim.keymap.set("n", "C", api.tree.change_root_to_node, opts "CD")
      vim.keymap.set("n", "P", function()
        local node = api.tree.get_node_under_cursor()
        print(node.absolute_path)
      end, opts "Print Node Path")

      vim.keymap.set("n", "Z", api.node.run.system, opts "Run System")
    end

    local nvim_tree = require "nvim-tree"

    nvim_tree.setup {
      on_attach = on_attach,
      disable_netrw = false,
      auto_reload_on_write = false,
      diagnostics = {
        enable = false,
        icons = {
          hint = "",
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
        timeout = 5000,
      },
      renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        full_name = false,
        highlight_opened_files = "none",
        highlight_modified = "none",
        -- root_folder_label = ":~:s?$?/..?",
        root_folder_label = false,
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
            default = "󰈚",
            symlink = "",
            folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
              symlink_open = "",
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
      actions = {
        use_system_clipboard = true,
        change_dir = {
          enable = true,
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
      },
    }
  end,
}
