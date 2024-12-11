---@type NvPluginSpec
-- NOTE: Improve Other LSP Functionalities
return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  -- commit = "898030df423a527c55a6fd85e85e58e840ff6e82",
  init = function()
    -- vim.keymap.set("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", { desc = "Lspsaga | Code Action", silent = true })
    vim.keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", { desc = "Lspsaga | Code Outline", silent = true })
    vim.keymap.set(
      "n",
      "<leader>lI",
      "<cmd>Lspsaga incoming_calls<cr>",
      { desc = "Lspsaga | Incoming Calls", silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>lO",
      "<cmd>Lspsaga outgoing_calls<cr>",
      { desc = "Lspsaga | Outgoing Calls", silent = true }
    )
    vim.keymap.set("n", "<leader>lr", "<cmd>Lspsaga rename<cr>", { desc = "Lspsaga | Rename", silent = true })
    vim.keymap.set(
      "n",
      "<leader>lj",
      "<cmd>Lspsaga diagnostic_jump_next<cr>",
      { desc = "Lspsaga | Next Diagnostic", silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>lk",
      "<cmd>Lspsaga diagnostic_jump_prev<cr>",
      { desc = "Lspsaga | Prev Diagnostic", silent = true }
    )

    -- vim.keymap.set("v", "<leader>la", "<cmd>Lspsaga code_action<cr>", { desc = "Lspsaga | Code Action", silent = true })
  end,
  opts = {
    preview = {
      lines_above = 0,
      lines_below = 10,
    },

    code_action = {
      num_shortcut = true,
      keys = {
        quit = ";",
        exec = "<CR>",
      },
    },

    scroll_preview = {
      scroll_down = "<C-f>",
      scroll_up = "<C-b>",
    },
    request_timeout = 2000,

    lightbulb = {
      enable = false,
      enable_in_insert = true,
      sign = true,
      sign_priority = 40,
      virtual_text = true,
    },

    rename = {
      quit = ";",
      exec = "<CR>",
      in_select = false,
    },

    finder = {
      edit = { "o", "<CR>" },
      vsplit = "s",
      split = "i",
      tabe = "t",
      quit = { ";", "<ESC>" },
    },

    diagnostic = {
      insert_winblend = 0,
      jump_num_shortcut = true,
      on_insert = false,
      on_insert_follow = false,
      show_code_action = true,
      show_source = true,
      custom_fix = nil,
      custom_msg = nil,
      text_hl_follow = false,
      border_follow = true,
      keys = {
        exec_action = "o",
        quit = ";",
      },
    },

    symbol_in_winbar = {
      enable = true,
      separator = "  ",
      hide_keyword = true,
      show_file = false,
      folder_level = 0,
    },

    definition = {
      edit = "<C-c>o",
      vsplit = "<C-c>v",
      split = "<C-c>i",
      tabe = "<C-c>t",
      quit = ";",
      close = "<Esc>",
    },

    ui = {
      theme = "round",
      border = "rounded",
      winblend = 0,
      expand = "",
      collaspe = "",
      preview = " ",
      code_action = "󱧣 ",
      diagnostic = "🐞",
      hover = " ",
      kind = {},
    },

    outline = {
      win_position = "right",
      win_with = "",
      win_width = 30,
      show_detail = true,
      auto_preview = true,
      auto_refresh = true,
      auto_close = true,
      custom_sort = nil,
      keys = {
        jump = "o",
        expand_collaspe = "u",
        quit = ";",
      },
    },

    callhierarchy = {
      show_detail = false,
      keys = {
        edit = "e",
        vsplit = "s",
        split = "i",
        tabe = "t",
        jump = "o",
        quit = ";",
        expand_collaspe = "u",
      },
    },
  },
}
