-- NOTE: NvChad Related Mappings
---@type MappingsTable
local M = {}
local fn = vim.fn
local cwd = vim.fn.stdpath "config" .. "/"
local config_dir = { cwd }

M.LspLens = {
  n = {
    ["<leader>ll"] = {
      "<cmd>LspLensToggle<cr>",
      desc = "Toggle Code Lens",
      opts = { silent = true },
    },
  },
}

M.Harpoon = {
  n = {
    ["<leader>ha"] = {
      function()
        require("harpoon"):list():append()
        vim.notify("   Marked file", vim.log.levels.INFO, { title = "Harpoon" })
      end,
      desc = "Add Mark",
      opts = { silent = true },
    },
    ["<leader>hh"] = {
      function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
      end,
      desc = "Harpoon Menu",
      opts = { silent = true },
    },
    -- ["<leader>hn"] = {
    --   function()
    --     require("harpoon"):list():next()
    --   end,
    --   "Next",
    --   opts = { silent = true },
    -- },
    -- ["<leader>hp"] = {
    --   function()
    --     require("harpoon"):list():prev()
    --   end,
    --   "Previous",
    --   opts = { silent = true },
    -- },
  },
}

M.Swenv = {
  n = {
    ["<leader>vp"] = {
      ":lua=require('swenv.api').pick_venv()<cr>",
      desc = "Pick Venv",
      opts = { silent = true },
    },
  },
}

M.MarkdownPreview = {
  n = {
    ["<leader>m"] = {
      function()
        if vim.bo.filetype == "markdown" then
          vim.cmd "MarkdownPreviewToggle"
        else
          vim.notify("Only available in markdown", vim.log.levels.WARN, { title = "Markdown-Preview" })
        end
      end,
      desc = "Markdown Preview",
      opts = { silent = true },
    },
  },
}

M.NvimTree = {
  n = {
    ["<leader>e"] = {
      "<cmd>NvimTreeToggle<cr>",
      desc = "Explorer",
      opts = { silent = true },
    },
  },
}

M.Compiler = {
  n = {
    ["<leader>rr"] = {
      "<cmd>CompilerRedo<cr>",
      desc = "Redo Last Action",
      opts = { silent = true },
    },

    ["<leader>ro"] = {
      "<cmd>CompilerOpen<cr>",
      desc = "Open",
      opts = { silent = true },
    },

    ["<leader>rs"] = {
      "<cmd>CompilerStop<cr>",
      desc = "Stop All Tasks",
      opts = { silent = true },
    },

    ["<leader>rt"] = {
      "<cmd>CompilerToggleResults<cr>",
      desc = "Toggle Results.",
      opts = { silent = true },
    },
  },
}

M.Dap = {

  n = {
    ["<leader>dc"] = {
      "<cmd>lua require'dap'.continue()<cr>",
      desc = "Continue",
      opts = { silent = true },
    },

    ["<leader>do"] = {
      "<cmd>lua require'dap'.step_over()<cr>",
      desc = "Step Over",
      opts = { silent = true },
    },

    ["<leader>di"] = {
      "<cmd>lua require'dap'.step_into()<cr>",
      desc = "Step Into",
      opts = { silent = true },
    },

    ["<leader>du"] = {
      "<cmd>lua require'dap'.step_out()<cr>",
      desc = "Step Out",
      opts = { silent = true },
    },

    ["<leader>db"] = {
      "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
      desc = "Breakpoint",
      opts = { silent = true },
    },

    ["<leader>dB"] = {
      "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
      desc = "Breakpoint Condition",
      opts = { silent = true },
    },

    ["<leader>dd"] = {
      "<cmd>lua require'dapui'.toggle()<cr>",
      desc = "Dap UI",
      opts = { silent = true },
    },

    ["<leader>dl"] = {
      "<cmd>lua require'dap'.run_last()<cr>",
      desc = "Run Last",
      opts = { silent = true },
    },
  },
}

M.Neotest = {

  n = {
    ["<leader>Tt"] = {
      function()
        vim.cmd 'lua require("neotest").run.run(vim.fn.expand "%")'
      end,
      desc = "Run File",
      opts = { silent = true },
    },

    ["<leader>TT"] = {
      function()
        vim.cmd 'lua require("neotest").run.run(vim.loop.cwd())'
      end,
      desc = "Run All Test Files",
      opts = { silent = true },
    },

    ["<leader>Tr"] = {
      function()
        vim.cmd 'lua require("neotest").run.run()'
      end,
      desc = "Run Nearest",
      opts = { silent = true },
    },

    ["<leader>Td"] = {
      function()
        vim.cmd 'lua require("neotest").run.run { strategy = "dap" }'
      end,
      desc = "Run Dap",
      opts = { silent = true },
    },

    ["<leader>Ts"] = {
      function()
        vim.cmd 'lua require("neotest").summary.toggle()'
      end,
      desc = "Toggle Summary",
      opts = { silent = true },
    },

    ["<leader>To"] = {
      function()
        vim.cmd 'lua require("neotest").output.open { enter = true, auto_close = true }'
      end,
      desc = "Show Output",
      opts = { silent = true },
    },

    ["<leader>TO"] = {
      function()
        vim.cmd 'lua require("neotest").output_panel.toggle()'
      end,
      desc = "Toggle Output Panel",
      opts = { silent = true },
    },

    ["<leader>TS"] = {
      function()
        vim.cmd 'lua require("neotest").run.stop()'
      end,
      desc = "Stop",
      opts = { silent = true },
    },
  },
}

M.Neovim = {
  n = {
    ["<leader>nf"] = {
      function()
        require("telescope.builtin").find_files {
          prompt_title = "Config Files",
          search_dirs = config_dir,
          cwd = cwd,
        }
      end,
      desc = "Find Config Files",
      opts = { silent = true },
    },

    ["<leader>ng"] = {
      function()
        require("telescope.builtin").live_grep {
          prompt_title = "Config Files",
          search_dirs = config_dir,
          cwd = cwd,
        }
      end,
      desc = "Grep Config Files",
      opts = { silent = true },
    },

    -- ["<leader>nc"] = {
    --   "<cmd>NvCheatsheet<cr>",
    --   desc = "Cheatsheet",
    --   opts = { silent = true },
    -- },

    ["<leader>ni"] = {
      function()
        if vim.fn.has "nvim-0.9.0" == 1 then
          vim.cmd "Inspect"
        else
          vim.notify("Inspect isn't available in this neovim version", vim.log.levels.WARN, { title = "Inspect" })
        end
      end,
      desc = "Inspect",
      opts = { silent = true },
    }, -- only available on neovim >= 0.9

    ["<leader>nm"] = {
      "<cmd>messages<cr>",
      desc = "Messages",
      opts = { silent = true },
    },

    ["<leader>nh"] = {
      "<cmd>checkhealth<cr>",
      desc = "Health",
      opts = { silent = true },
    },

    ["<leader>nv"] = {
      function()
        local version = vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
        return vim.notify(version, vim.log.levels.INFO, { title = "Neovim Version" })
      end,
      desc = "Version",
      opts = { silent = true },
    },
    ["<leader>nr"] = {
      function()
        RunCode()
      end,
      desc = "Run Code",
      opts = { silent = true },
    },
  },
}

M.Sessions = {

  n = {
    ["<leader>so"] = {
      "<cmd>SessionStop<cr>",
      desc = "Stop",
      opts = { silent = true },
    },

    ["<leader>sl"] = {
      "<cmd>SessionLoad<cr>",
      desc = "Load",
      opts = { silent = true },
    },

    ["<leader>sL"] = {
      "<cmd>SessionLoad<cr>",
      desc = "Load Last",
      opts = { silent = true },
    },

    ["<leader>sd"] = {
      "<cmd>SessionDelete<cr>",
      desc = "Delete",
      opts = { silent = true },
    },
  },
}

M.Telescope = {

  n = {
    ["<leader>fa"] = {
      "<cmd>Telescope autocommands<cr>",
      desc = "Autocommmands",
      opts = { silent = true },
    },

    ["<leader>ff"] = {
      "<cmd>Telescope find_files<cr>",
      desc = "Files",
      opts = { silent = true },
    },

    ["<leader>fs"] = {
      "<cmd>Telescope persisted<cr>",
      desc = "Sessions",
      opts = { silent = true },
    },

    ["<leader>fm"] = {
      "<cmd>Telescope marks<cr>",
      desc = "Marks",
      opts = { silent = true },
    },

    ["<leader>fM"] = {
      "<cmd>Telescope man_pages<cr>",
      desc = "Man Pages",
      opts = { silent = true },
    },

    ["<leader>fw"] = {
      "<cmd>Telescope live_grep<cr>",
      desc = "Word",
      opts = { silent = true },
    },

    ["<leader>ft"] = {
      "<cmd>Telescope themes<cr>",
      desc = "Themes",
      opts = { silent = true },
    },

    ["<leader>fb"] = {
      "<cmd>Telescope buffers<cr>",
      desc = "Buffers",
      opts = { silent = true },
    },

    ["<leader>fn"] = {
      "<cmd>lua require('telescope').extensions.notify.notify()<cr>",
      desc = "Notify History",
      opts = { silent = true },
    },

    ["<leader>fp"] = {
      "<cmd>Telescope projects<cr>",
      desc = "Projects",
      opts = { silent = true },
    },

    ["<leader>fh"] = {
      "<cmd>Telescope help_tags<cr>",
      desc = "Help",
      opts = { silent = true },
    },

    ["<leader>fk"] = {
      "<cmd>Telescope keymaps<cr>",
      desc = "Keymaps",
      opts = { silent = true },
    },

    ["<leader>fC"] = {
      "<cmd>Telescope commands<cr>",
      desc = "Commands",
      opts = { silent = true },
    },

    ["<leader>fr"] = {
      "<cmd>Telescope oldfiles<cr>",
      desc = "Recent Files",
      opts = { silent = true },
    },

    ["<leader>fH"] = {
      "<cmd>Telescope highlights<cr>",
      desc = "Highlights",
      opts = { silent = true },
    },

    ["<leader>ls"] = {
      "<cmd>Telescope lsp_document_symbols<cr>",
      desc = "Buffer Symbols",
      opts = { silent = true },
    },

    ["<leader>lS"] = {
      "<cmd>Telescope lsp_workspace_symbols<cr>",
      desc = "Workspace Symbols",
      opts = { silent = true },
    },

    ["<leader>gb"] = {
      "<cmd>Telescope git_branches<cr>",
      desc = "Checkout branch",
      opts = { silent = true },
    },

    ["<leader>gc"] = {
      "<cmd>Telescope git_commits<cr>",
      desc = "Checkout commit",
      opts = { silent = true },
    },
  },
}

M.Toggleterm = {

  n = {
    ["<leader>tf"] = {
      "<cmd>ToggleTerm direction=float<cr>",
      desc = "Float Terminal",
      opts = { silent = true },
    },

    ["<leader>th"] = {
      "<cmd>ToggleTerm direction=horizontal<cr>",
      desc = "Horizontal Terminal",
      opts = { silent = true },
    },

    ["<leader>tv"] = {
      "<cmd>ToggleTerm direction=vertical<cr>",
      desc = "Vertical Terminal",
      opts = { silent = true },
    },

    ["<leader>gg"] = {
      function()
        ClickGit()
      end,
      desc = "Lazygit",
      opts = { silent = true },
    },
  },
}

M.Trouble = {

  n = {
    ["<leader>lb"] = {
      "<cmd>TroubleToggle document_diagnostics<cr>",
      desc = "Buffer Diagnostics",
      opts = { silent = true },
    },

    ["<leader>lw"] = {
      "<cmd>TroubleToggle workspace_diagnostics<cr>",
      desc = "Workspace Diagnostics",
      opts = { silent = true },
    },

    ["<leader>fT"] = {
      "<cmd>TodoTelescope<cr>",
      desc = "Todo",
      opts = { silent = true },
    },
  },
}

M.Lspsaga = {

  n = {
    ["<leader>la"] = {
      "<cmd>Lspsaga code_action<cr>",
      desc = "Code Action",
      opts = { silent = true },
    },

    ["<leader>lo"] = {
      "<cmd>Lspsaga outline<cr>",
      desc = "Code Outline",
      opts = { silent = true },
    },

    ["<leader>lI"] = {
      "<cmd>Lspsaga incoming_calls<cr>",
      desc = "Incoming Calls",
      opts = { silent = true },
    },

    ["<leader>lO"] = {
      "<cmd>Lspsaga outgoing_calls<cr>",
      desc = "Outgoing Calls",
      opts = { silent = true },
    },

    ["<leader>lr"] = {
      "<cmd>Lspsaga rename<cr>",
      desc = "Rename",
      opts = { silent = true },
    },
  },
  v = {
    ["<leader>la"] = {
      "<cmd>Lspsaga code_action<cr>",
      desc = "Code Action",
      opts = { silent = true },
    },
  },
}

M.Mason = {

  n = {
    ["<leader>lm"] = {
      "<cmd>Mason<cr>",
      desc = "Mason Installer",
      opts = { silent = true },
    },

    ["<leader>lj"] = {
      "<cmd>Lspsaga diagnostic_jump_next<cr>",
      desc = "Next Diagnostic",
      opts = { silent = true },
    },

    ["<leader>lk"] = {
      "<cmd>Lspsaga diagnostic_jump_prev<cr>",
      desc = "Prev Diagnostic",
      opts = { silent = true },
    },
  },
}

M.LSP = {

  n = {
    ["<leader>lf"] = {
      "<cmd>Format<cr>",
      desc = "Format",
      opts = { silent = true },
    },

    ["<leader>li"] = {
      "<cmd>LspInfo<cr>",
      desc = "Info",
      opts = { silent = true },
    },

    ["<leader>lR"] = {
      "<cmd>LspRestart<cr>",
      desc = "Restart",
      opts = { silent = true },
    },
  },
  v = {
    ["<leader>lf"] = {
      "<cmd>Format<cr>",
      desc = "Format",
      opts = { silent = true },
    },
  },
}

if vim.fn.has "nvim-0.10" == 1 then
  M.LSP.n["<leader>lh"] = {
    function()
      if vim.lsp.inlay_hint.is_enabled(0) then
        vim.cmd "lua=vim.lsp.inlay_hint.enable(0, false)"
      else
        vim.cmd "lua=vim.lsp.inlay_hint.enable(0, true)"
      end
    end,
    desc = "Inlay Hints",
    opts = { silent = true },
  }
end

M.GitBlame = {

  n = {

    ["<leader>gO"] = {
      "<cmd>GitBlameOpenCommitURL<cr>",
      desc = "Open Commit Url",
      opts = { silent = true },
    },

    ["<leader>gc"] = {
      "<cmd>GitBlameCopyCommitURL<cr>",
      desc = "Copy Commit Url",
      opts = { silent = true },
    },

    ["<leader>gf"] = {
      "<cmd>GitBlameOpenFileURL<cr>",
      desc = "Open File Url",
      opts = { silent = true },
    },

    ["<leader>gC"] = {
      "<cmd>GitBlameCopyFileURL<cr>",
      desc = "Copy File Url",
      opts = { silent = true },
    },

    ["<leader>gs"] = {
      "<cmd>GitBlameCopySHA<cr>",
      desc = "Copy SHA",
      opts = { silent = true },
    },

    ["<leader>gt"] = {
      function()
        if vim.g.gitblame_enabled ~= true then
          vim.cmd "GitBlameEnable"
          vim.g.gitblame_enabled = true
        else
          vim.cmd "GitBlameDisable"
          vim.g.gitblame_enabled = false
        end
      end,
      desc = "Toggle Blame",
      opts = { silent = true },
    },
  },
}

M.GitSigns = {

  n = {
    ["<leader>gp"] = {
      "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
      desc = "Preview Hunk",
      opts = { silent = true },
    },

    ["<leader>gj"] = {
      "<cmd>lua require 'gitsigns'.next_hunk()<cr>",
      desc = "Next Hunk",
      opts = { silent = true },
    },

    ["<leader>gk"] = {
      "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",
      desc = "Prev Hunk",
      opts = { silent = true },
    },

    ["<leader>gl"] = {
      "<cmd>lua require 'gitsigns'.blame_line()<cr>",
      desc = "Blame Line",
      opts = { silent = true },
    },
  },
}

M.Diffview = {

  n = {
    ["<leader>gd"] = {
      function()
        if next(require("diffview.lib").views) == nil then
          vim.cmd "DiffviewOpen"
        else
          vim.cmd "DiffviewClose"
        end
      end,
      desc = "Toggle Diffview",
      opts = { silent = true },
    },
  },
}

M.Lazy = {
  n = {
    ["<leader>pc"] = {
      "<cmd>Lazy clean<cr>",
      desc = "Clean",
      opts = { silent = true },
    },

    ["<leader>pC"] = {
      "<cmd>Lazy check<cr>",
      desc = "Check",
      opts = { silent = true },
    },

    ["<leader>pd"] = {
      "<cmd>Lazy debug<cr>",
      desc = "Debug",
      opts = { silent = true },
    },

    ["<leader>pi"] = {
      "<cmd>Lazy install<cr>",
      desc = "Install",
      opts = { silent = true },
    },

    ["<leader>ps"] = {
      "<cmd>Lazy sync<cr>",
      desc = "Sync",
      opts = { silent = true },
    },

    ["<leader>pl"] = {
      "<cmd>Lazy log<cr>",
      desc = "Log",
      opts = { silent = true },
    },

    ["<leader>ph"] = {
      "<cmd>Lazy home<cr>",
      desc = "Home",
      opts = { silent = true },
    },

    ["<leader>pH"] = {
      "<cmd>Lazy help<cr>",
      desc = "Help",
      opts = { silent = true },
    },

    ["<leader>pp"] = {
      "<cmd>Lazy profile<cr>",
      desc = "Profile",
      opts = { silent = true },
    },

    ["<leader>pu"] = {
      "<cmd>Lazy update<cr>",
      desc = "Update",
      opts = { silent = true },
    },
  },
}

M.General = {
  n = {
    ["<leader>R"] = {
      "<cmd>%d+<cr>",
      desc = "Remove All Text",
      opts = { silent = true },
    },

    ["<leader>y"] = {
      "<cmd>%y+<cr>",
      desc = "Yank All Text",
      opts = { silent = true },
    },

    ["<leader>q"] = {
      "<cmd>qa!<cr>",
      desc = "Quit",
      opts = { silent = true },
    },

    ["<leader>c"] = {
      "<cmd>Bdelete!<cr>",
      desc = "Close Buffer",
      opts = { silent = true },
    },

    ["<leader>ob"] = {
      function()
        if vim.o.showtabline == 2 then
          vim.o.showtabline = 0
        else
          vim.o.showtabline = 2
        end
      end,
      desc = "Toggle Tabufline",
      opts = { silent = true },
    },

    ["<leader>os"] = {
      function()
        if vim.o.laststatus == 3 then
          vim.o.laststatus = 0
        else
          vim.o.laststatus = 3
        end
      end,
      desc = "Toggle Statusline",
      opts = { silent = true },
    },

    ["<leader>ol"] = {
      function()
        if vim.o.number then
          vim.o.number = false
        else
          vim.o.number = true
        end
      end,
      desc = "Toggle Line Number",
      opts = { silent = true },
    },

    ["<leader>or"] = {
      function()
        if vim.o.relativenumber then
          vim.o.relativenumber = false
        else
          vim.o.relativenumber = true
        end
      end,
      desc = "Toggle Relative Number",
      opts = { silent = true },
    },
    ["<leader>ot"] = {
      function()
        require("base46").toggle_theme()
      end,
      desc = "Toggle Theme",
      opts = { silent = true },
    },

    ["<leader>oT"] = {
      function()
        require("base46").toggle_transparency()
      end,
      desc = "Toggle Transparency",
      opts = { silent = true },
    },

    ["<leader>ow"] = {
      function()
        if vim.o.wrap then
          vim.o.wrap = false
        else
          vim.o.wrap = true
        end
      end,
      desc = "Toggle Wrap",
      opts = { silent = true },
    },

    -- ["jk"] = {
    --   "<Esc>",
    --   "Enter insert mode",
    -- opts = { silent = true },
    -- },

    ["j"] = {
      "v:count == 0 ? 'gj' : 'j'",
      desc = "Better Down",
      opts = { expr = true, silent = true },
    },

    ["k"] = {
      "v:count == 0 ? 'gk' : 'k'",
      desc = "Better Up",
      opts = { expr = true, silent = true },
    },

    ["<C-j>"] = {
      "<C-w>j",
      desc = "Go to upper window",
      opts = { silent = true },
    },

    ["<C-k>"] = {
      "<C-w>k",
      desc = "Go to lower window",
      opts = { silent = true },
    },

    ["<C-h>"] = {
      "<C-w>h",
      desc = "Go to left window",
      opts = { silent = true },
    },

    ["<C-l>"] = {
      "<C-w>l",
      desc = "Go to right window",
      opts = { silent = true },
    },

    -- ["<Leader>w"] = {
    --   "<C-w>w",
    --   "Go to next window",
    -- opts = { silent = true },
    -- },
    ["<leader>w"] = {
      function()
        if vim.bo.buftype == "terminal" then
          vim.cmd "Bdelete!"
          vim.cmd "silent! close"
        elseif #vim.api.nvim_list_wins() > 1 then
          vim.cmd "silent! close"
        else
          vim.notify("Can't Close Window", vim.log.levels.WARN, { title = "Close Window" })
        end
      end,
      desc = "Close window",
      opts = { silent = true },
    },

    ["<C-Up>"] = {
      "<cmd>resize +2<CR>",
      desc = "Add size at the top",
      opts = { silent = true },
    },

    ["<C-Down>"] = {
      "<cmd>resize -2<CR>",
      desc = "Add size at the bottom",
      opts = { silent = true },
    },

    ["<C-Left>"] = {
      "<cmd>vertical resize +2<CR>",
      desc = "Add size at the left",
      opts = { silent = true },
    },

    ["<C-Right>"] = {
      "<cmd>vertical resize -2<CR>",
      desc = "Add size at the right",
      opts = { silent = true },
    },

    ["H"] = {
      "<cmd>tabp<cr>",
      desc = "Go to previous buffer",
      opts = { silent = true },
    },
    ["L"] = {
      "<cmd>tabn<cr>",
      desc = "Go to next buffer",
      opts = { silent = true },
    },

    ["<Left>"] = {
      "<cmd>tabprevious<CR>",
      desc = "Go to previous tab",
      opts = { silent = true },
    },

    ["<Right>"] = {
      "<cmd>tabnext<CR>",
      desc = "Go to next tab",
      opts = { silent = true },
    },

    ["<Up>"] = {
      "<cmd>tabnew<CR>",
      desc = "New tab",
      opts = { silent = true },
    },

    ["<Down>"] = {
      "<cmd>tabclose<CR>",
      desc = "Close tab",
      opts = { silent = true },
    },

    ["<"] = {
      "<<",
      desc = "Indent backward",
      opts = { silent = true },
    },

    [">"] = {
      ">>",
      desc = "Indent forward",
      opts = { silent = true },
    },

    ["<A-j>"] = {
      ":m .+1<CR>==",
      desc = "Move the line up",
      opts = { silent = true },
    },

    ["<A-k>"] = {
      ":m .-2<CR>==",
      desc = "Move the line down",
      opts = { silent = true },
    },
  },
  i = {
    -- ["jk"] = {
    --   "<Esc>",
    --   "Enter insert mode",
    -- },

    ["<A-j>"] = {
      "<Esc>:m .+1<CR>==gi",
      desc = "Move the line up",
      opts = { silent = true },
    },

    ["<A-k>"] = {
      "<Esc>:m .-2<CR>==gi",
      desc = "Move the line down",
      opts = { silent = true },
    },
  },
  v = {
    ["j"] = {
      "v:count == 0 ? 'gj' : 'j'",
      desc = "Better Down",
      opts = { expr = true, silent = true },
    },

    ["k"] = {
      "v:count == 0 ? 'gk' : 'k'",
      desc = "Better Up",
      opts = { expr = true, silent = true },
    },

    ["p"] = {
      '"_dP',
      desc = "Better Paste",
      opts = { silent = true },
    },

    -- ["jk"] = {
    --   "<Esc>",
    --   "Enter insert mode",
    -- },

    ["<"] = {
      "<gv",
      desc = "Indent backward",
      opts = { silent = true },
    },

    [">"] = {
      ">gv",
      desc = "Indent forward",
      opts = { silent = true },
    },

    ["<A-j>"] = {
      ":m '>+1<CR>gv=gv",
      desc = "Move the selected text up",
      opts = { silent = true },
    },

    ["<A-k>"] = {
      ":m '<-2<CR>gv=gv",
      desc = "Move the selected text down",
      opts = { silent = true },
    },
  },
  c = {
    ["<Tab>"] = {
      function()
        if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
          return "<CR>/<C-r>/"
        end
        return "<C-z>"
      end,
      desc = "Word Search Increment",
      opts = { expr = true },
    },

    ["<S-Tab>"] = {
      function()
        if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
          return "<CR>?<C-r>/"
        end
        return "<S-Tab>"
      end,
      desc = "Word Search Decrement",
      opts = { expr = true },
    },
  },
  t = {
    ["<Esc>"] = {
      "<C-\\><C-n>",
      desc = "Enter insert mode",
      opts = { silent = true },
    },
  },
}

for _, module in pairs(M) do
  for mode, maps in pairs(module) do
    for key, val in pairs(maps) do
      local opts = vim.tbl_deep_extend("force", val.opts, { desc = val.desc })
      vim.keymap.set(mode, key, val[1], opts)
    end
  end
end
