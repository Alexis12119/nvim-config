local M = {}
local fn = vim.fn

local function close()
  if vim.bo.buftype == "terminal" then
    vim.cmd "Bdelete!"
    vim.cmd "silent! close"
  elseif #vim.api.nvim_list_wins() > 1 then
    vim.cmd "silent! close"
  else
    vim.notify("Can't Close Window", vim.log.levels.WARN, { title = "Close Window" })
  end
end

M.general = {
  i = {
    -- ["jk"] = {
    --   "<Esc>",
    --   "Enter insert mode",
    -- },

    ["<A-j>"] = {
      "<Esc>:m .+1<CR>==gi",
      "Move the line up",
    },

    ["<A-k>"] = {
      "<Esc>:m .-2<CR>==gi",
      "Move the line down",
    },
  },
  n = {
    ["<F5>"] = {
      function()
        run_code()
      end,
      "Run Code",
    },

    -- ["jk"] = {
    --   "<Esc>",
    --   "Enter insert mode",
    -- },

    ["j"] = {
      "v:count == 0 ? 'gj' : 'j'",
      "Better Down",
      opts = { expr = true, silent = true },
    },

    ["k"] = {
      "v:count == 0 ? 'gk' : 'k'",
      "Better Up",
      opts = { expr = true, silent = true },
    },

    ["<C-j>"] = {
      "<C-w>j",
      "Go to upper window",
    },

    ["<C-k>"] = {
      "<C-w>k",
      "Go to lower window",
    },

    ["<C-h>"] = {
      "<C-w>h",
      "Go to left window",
    },

    ["<C-l>"] = {
      "<C-w>l",
      "Go to right window",
    },

    -- ["<Leader>w"] = {
    --   "<C-w>w",
    --   "Go to next window",
    -- },

    [";"] = {
      function()
        close()
      end,
      "Close window",
    },

    ["<C-Up>"] = {
      ":resize +2<CR>",
      "Add size at the top",
    },

    ["<C-Down>"] = {
      ":resize -2<CR>",
      "Add size at the bottom",
    },

    ["<C-Left>"] = {
      ":vertical resize +2<CR>",
      "Add size at the left",
    },

    ["<C-Right>"] = {
      ":vertical resize -2<CR>",
      "Add size at the right",
    },

    ["H"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Go to previous buffer",
    },
    ["L"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Go to next buffer",
    },

    ["<Left>"] = {
      ":tabprevious<CR>",
      "Go to previous tab",
    },

    ["<Right>"] = {
      ":tabnext<CR>",
      "Go to next tab",
    },

    ["<Up>"] = {
      ":tabnew<CR>",
      "New tab",
    },

    ["<Down>"] = {
      ":tabclose<CR>",
      "Close tab",
    },

    ["<"] = {
      "<<",
      "Indent backward",
    },

    [">"] = {
      ">>",
      "Indent forward",
    },

    ["<A-j>"] = {
      ":m .+1<CR>==",
      "Move the line up",
    },

    ["<A-k>"] = {
      ":m .-2<CR>==",
      "Move the line down",
    },
  },
  v = {
    ["j"] = {
      "v:count == 0 ? 'gj' : 'j'",
      "Better Down",
      opts = { expr = true, silent = true },
    },

    ["k"] = {
      "v:count == 0 ? 'gk' : 'k'",
      "Better Up",
      opts = { expr = true, silent = true },
    },

    ["p"] = {
      '"_dP',
      "Better Paste",
    },

    -- ["jk"] = {
    --   "<Esc>",
    --   "Enter insert mode",
    -- },

    ["<"] = {
      "<gv",
      "Indent backward",
    },

    [">"] = {
      ">gv",
      "Indent forward",
    },

    ["<A-j>"] = {
      ":m '>+1<CR>gv=gv",
      "Move the selected text up",
    },

    ["<A-k>"] = {
      ":m '<-2<CR>gv=gv",
      "Move the selected text down",
    },
  },
  x = {

    ["j"] = {
      "v:count == 0 ? 'gj' : 'j'",
      "Better Down",
      opts = { expr = true, silent = true },
    },

    ["k"] = {
      "v:count == 0 ? 'gk' : 'k'",
      "Better Up",
      opts = { expr = true, silent = true },
    },

    ["<A-j>"] = {
      ":m '>+1<CR>gv=gv",
      "Move the selected text up",
    },

    ["<A-k>"] = {
      ":m '<-2<CR>gv=gv",
      "Move the selected text down",
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
      "Word Search Increment",
    },

    ["<S-Tab>"] = {
      function()
        if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
          return "<CR>?<C-r>/"
        end
        return "<S-Tab>"
      end,
      "Word Search Decrement",
    },
  },
  t = {
    ["<Esc>"] = {
      "<C-\\><C-n>",
      "Enter insert mode",
    },
  },
}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
    -- cycle through buffers
    ["<tab>"] = "",
    ["<Up>"] = "",
    ["<Down>"] = "",
    ["<C-c>"] = "",
    ["<C-s>"] = "",
    ["<Esc>"] = "",
    ["<leader>rn"] = "",
    ["<leader>/"] = "",
    ["<S-tab>"] = "",
    ["<leader>x"] = "",
    ["gD"] = "",
    ["gd"] = "",
    ["K"] = "",
    ["gi"] = "",
    ["<leader>ls"] = "",
    ["<leader>D"] = "",
    ["<leader>ra"] = "",
    ["<leader>ca"] = "",
    ["gr"] = "",
    ["<leader>f"] = "",
    ["[d"] = "",
    ["]d"] = "",
    ["<leader>q"] = "",
    ["<leader>wa"] = "",
    ["<leader>wr"] = "",
    ["<leader>wl"] = "",
    ["<leader>e"] = "",
    ["<C-n>"] = "",
    ["<leader>fa"] = "",
    ["<leader>fw"] = "",
    ["<leader>fb"] = "",
    ["<leader>fh"] = "",
    ["<leader>fo"] = "",
    ["<leader>fz"] = "",
    ["<leader>cm"] = "",
    ["<leader>gt"] = "",
    ["<leader>pt"] = "",
    ["<leader>th"] = "",
    ["<leader>b"] = "",
    ["<leader>ma"] = "",
    ["<leader>wK"] = "",
    ["<leader>wk"] = "",
    ["<leader>cc"] = "",
    ["]c"] = "",
    ["[c"] = "",
    ["<leader>rh"] = "",
    ["<leader>ph"] = "",
    ["<leader>gb"] = "",
    ["<leader>td"] = "",
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
    ["<leader>h"] = "",
    ["<leader>v"] = "",
    ["<leader>fm"] = "",
    ["<leader>ch"] = "",
    ["<leader>ff"] = "",
    ["<leader>n"] = "",
  },
}

return M
