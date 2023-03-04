local fn = vim.fn

local modes = {
  normal_mode = "n",
  insert_mode = "i",
  terminal_mode = "t",
  visual_mode = "v",
  visual_block_mode = "x",
  command_mode = "c",
}

local function close()
  if vim.bo.buftype == "terminal" then
    vim.cmd [[
    Bdelete!
    silent! close
    ]]
  elseif #vim.api.nvim_list_wins() > 1 then
    vim.cmd "silent! close"
  else
    vim.notify("Can't Close Window", vim.log.levels.WARN, { title = "Close Window" })
  end
end

local function forward_search()
  if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
    return "<CR>/<C-r>/"
  end
  return "<C-z>"
end

local function backward_search()
  if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
    return "<CR>?<C-r>/"
  end
  return "<S-Tab>"
end

local keymaps = {
  normal_mode = {

    -- ["jk"] = {
    --   cmd = "<Esc>",
    --   desc = "Enter insert mode",
    -- },

    ["C-j"] = {
      cmd = "<C-w>j",
      desc = "Go to upper window",
    },
    ["C-k"] = {
      cmd = "<C-w>k",
      desc = "Go to lower window",
    },
    ["C-h"] = {
      cmd = "<C-w>h",
      desc = "Go to left window",
    },
    ["C-l"] = {
      cmd = "<C-w>l",
      desc = "Go to right window",
    },

    ["<Leader>w"] = {
      cmd = "<C-w>w",
      desc = "Go to next window",
    },

    [";"] = {
      cmd = close,
      desc = "Close window",
    },

    ["<C-Up>"] = {
      cmd = ":resize +2<CR>",
      desc = "Add size at the top",
    },
    ["<C-Down>"] = {
      cmd = ":resize -2<CR>",
      desc = "Add size at the bottom",
    },
    ["<C-Left>"] = {
      cmd = ":vertical resize +2<CR>",
      desc = "Add size at the left",
    },
    ["<C-Right>"] = {
      cmd = ":vertical resize -2<CR>",
      desc = "Add size at the right",
    },

    ["H"] = {
      cmd = ":bprevious<CR>",
      desc = "Go to previous buffer",
    },
    ["L"] = {
      cmd = ":bnext<CR>",
      desc = "Go to next buffer",
    },

    ["<Left>"] = {
      cmd = ":tabprevious<CR>",
      desc = "Go to previous tab",
    },
    ["<Right>"] = {
      cmd = ":tabnext<CR>",
      desc = "Go to next tab",
    },
    ["<Up>"] = {
      cmd = ":tabnew<CR>",
      desc = "New tab",
    },
    ["<Down>"] = {
      cmd = ":tabclose<CR>",
      desc = "Close tab",
    },

    ["<"] = {
      cmd = "<<",
      desc = "Indent backward",
    },
    [">"] = {
      cmd = ">>",
      desc = "Indent forward",
    },

    ["<A-j>"] = {
      cmd = ":m .+1<CR>==",
      desc = "Move the line up",
    },
    ["<A-k>"] = {
      cmd = ":m .-2<CR>==",
      desc = "Move the line down",
    },
  },
  insert_mode = {

    -- ["jk"] = {
    --   cmd = "<Esc>",
    --   desc = "Enter insert mode",
    -- },

    ["<A-j>"] = {
      cmd = "<Esc>:m .+1<CR>==gi",
      desc = "Move the line up",
    },
    ["<A-k>"] = {
      cmd = "<Esc>:m .-2<CR>==gi",
      desc = "Move the line down",
    },
  },
  terminal_mode = {

    ["<Esc>"] = {
      cmd = "<C-\\><C-n>",
      desc = "Enter insert mode",
    },
  },
  visual_mode = {

    ["p"] = {
      cmd = '"_dP',
      desc = "Better Paste",
    },

    -- ["jk"] = {
    --   cmd = "<Esc>",
    --   desc = "Enter insert mode",
    -- },

    ["<"] = {
      cmd = "<gv",
      desc = "Indent backward",
    },
    [">"] = {
      cmd = ">gv",
      desc = "Indent forward",
    },

    ["<A-j>"] = {
      cmd = ":m '>+1<CR>gv=gv",
      desc = "Move the selected text up",
    },
    ["<A-k>"] = {
      cmd = ":m '<-2<CR>gv=gv",
      desc = "Move the selected text down",
    },
  },
  visual_block_mode = {

    ["<A-j>"] = {
      cmd = ":m '>+1<CR>gv=gv",
      desc = "Move the selected text up",
    },
    ["<A-k>"] = {
      cmd = ":m '<-2<CR>gv=gv",
      desc = "Move the selected text down",
    },
  },
  command_mode = {

    ["<Tab>"] = {
      cmd = forward_search,
      desc = "Word Search Increment",
    },
    ["<S-Tab>"] = {
      cmd = backward_search,
      desc = "Word Search Decrement",
    },
  },
}

set_keymaps(keymaps.normal_mode, modes.normal_mode)
set_keymaps(keymaps.insert_mode, modes.insert_mode)
set_keymaps(keymaps.terminal_mode, modes.terminal_mode)
set_keymaps(keymaps.visual_mode, modes.visual_mode)
set_keymaps(keymaps.visual_block_mode, modes.visual_block_mode)
set_keymaps(keymaps.command_mode, modes.command_mode)
