return {
  "folke/which-key.nvim",
  module = true,
  cmd = "WhichKey",
  keys = "<leader>",
  config = function()
    local function toggle_distraction_free()
      if vim.bo.buftype == "" and vim.bo.filetype ~= "" then
        if vim.o.cmdheight ~= 0 or vim.o.laststatus ~= 0 or vim.o.showtabline ~= 0 then
          vim.opt.cmdheight = 0
          vim.opt.laststatus = 0
          vim.opt.showtabline = 0
        else
          vim.opt.cmdheight = 1
          vim.opt.laststatus = 3
          vim.opt.showtabline = 2
        end
      end
    end

    local mappings = {
      ["r"] = { ":%d+<cr>", "Remove All Text" },
      ["y"] = { ":%y+<cr>", "Yank All Text" },
      ["e"] = { ":NvimTreeToggle<cr>", "Explorer" },
      ["D"] = { toggle_distraction_free, "Distraction Free" },
      ["q"] = { ":qa!<cr>", "Quit" },
      ["c"] = { ":Bdelete!<cr>", "Close Buffer" },
      ["m"] = {
        function()
          if vim.bo.filetype == "markdown" then
            vim.cmd "MarkdownPreviewToggle"
          else
            vim.notify("Only available in markdown", vim.log.levels.WARN, { title = "Markdown-Preview" })
          end
        end,
        "Markdown Preview",
      },
      p = {
        name = "Plugin",
        c = { ":Lazy clean<cr>", "Clean" },
        C = { ":Lazy check<cr>", "Check" },
        d = { ":Lazy debug<cr>", "Debug" },
        i = { ":Lazy install<cr>", "Install" },
        s = { ":Lazy sync<cr>", "Sync" },
        l = { ":Lazy log<cr>", "Log" },
        h = { ":Lazy home<cr>", "Home" },
        H = { ":Lazy help<cr>", "Help" },
        p = { ":Lazy profile<cr>", "Profile" },
        u = { ":Lazy update<cr>", "Update" },
      },
      n = {
        name = "Neovim",
        r = { ":Reload<cr>", "Core Reload " },
        c = { ":e $MYVIMRC<cr>", "Configuration" },
        i = {
          function()
            if vim.fn.has "nvim-0.9.0" == 1 then
              vim.cmd "Inspect"
            else
              vim.notify("Inspect isn't available in this neovim version", vim.log.levels.WARN, { title = "Inspect" })
            end
          end,
          "Inspect",
        }, -- only available on neovim >= 0.9
        u = { ":Update<cr>", "Update" },
        m = { ":messages<cr>", "Messages" },
        h = { ":checkhealth<cr>", "Health" },
        v = {
          function()
            local version = vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
            return vim.notify(version, vim.log.levels.INFO, { title = "Neovim Version" })
          end,
          "Version",
        },
      },
      g = {
        name = "Git",
        g = {
          function()
            local Terminal = require("toggleterm.terminal").Terminal
            local lazygit = Terminal:new { cmd = "lazygit", hidden = true }
            lazygit:toggle()
          end,
          "Lazygit",
        },
        j = { ":lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { ":lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        l = { ":lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        p = { ":lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { ":lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { ":lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        s = { ":lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        u = {
          ":lua require 'gitsigns'.undo_stage_hunk()<cr>",
          "Undo Stage Hunk",
        },
        o = { ":Telescope git_status<cr>", "Open changed file" },
        b = { ":Telescope git_branches<cr>", "Checkout branch" },
        c = { ":Telescope git_commits<cr>", "Checkout commit" },
        d = {
          ":Gitsigns diffthis HEAD<cr>",
          "Diff",
        },
      },
      l = {
        name = "LSP",
        f = { ":Format<cr>", "Format" },
        a = { ":Lspsaga code_action<cr>", "Code Action" },
        i = { ":LspInfo<cr>", "Info" },
        o = { ":Lspsaga outline<cr>", "Code Outline" },
        I = { ":Lspsaga incoming_calls<cr>", "Incoming Calls" },
        O = { ":Lspsaga outgoing_calls<cr>", "Outgoing Calls" },
        m = { ":Mason<cr>", "Mason Installer" },
        j = {
          ":Lspsaga diagnostic_jump_next<cr>",
          "Next Diagnostic",
        },
        k = {
          ":Lspsaga diagnostic_jump_prev<cr>",
          "Prev Diagnostic",
        },
        r = { ":Lspsaga rename<cr>", "Rename" },
        d = { ":Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
        w = { ":Telescope diagnostics<cr>", "Workspace Diagnostics" },
        s = { ":Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = { ":Telescope lsp_workspace_symbols<cr>", "Workspace Symbols" },
      },
      f = {
        name = "Find",
        a = { ":Telescope autocommands<cr>", "Autocommmands" },
        f = { ":Telescope find_files<cr>", "Files" },
        t = { ":Telescope live_grep<cr>", "Text" },
        T = { ":TodoTelescope<cr>", "Todo" },
        -- B = { ":Telescope bookmarks<cr>", "Browswer Bookmarks" },
        b = { ":Telescope buffers<cr>", "Buffers" },
        n = { ":lua require('telescope').extensions.notify.notify()<cr>", "Notify History" },
        c = { ":Telescope colorscheme<cr>", "Colorscheme" },
        p = { ":Telescope projects<cr>", "Projects" },
        P = {
          "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
          "Colorscheme with Preview",
        },
        -- s = { ":Telescope persisted<cr>", "Sessions" },
        h = { ":Telescope help_tags<cr>", "Help" },
        k = { ":Telescope keymaps<cr>", "Keymaps" },
        C = { ":Telescope commands<cr>", "Commands" },
        r = { ":Telescope oldfiles<cr>", "Recent Files" },
        H = { ":Telescope highlights<cr>", "Highlights" },
      },
      t = {
        name = "Terminal",
        f = { ":ToggleTerm direction=float<cr>", "Float" },
        h = { ":ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
        v = { ":ToggleTerm size=50 direction=vertical<cr>", "Vertical" },
      },
    }

    which_key_add(mappings, "n")
  end,
}
