-- NOTE: Utilities and Commands

local command = vim.api.nvim_create_user_command

command("Format", function(args)
  local status_ok, conform = pcall(require, "conform")
  if not status_ok then
    return vim.notify "conform.nvim isn't installed!!!"
  end

  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  conform.format { async = true, lsp_fallback = true, range = range }
  vim.notify("Format Done", vim.log.levels.INFO, { title = "Format" })
end, { nargs = "*", desc = "Code Format", range = true })

command("LuaSnipEdit", function()
  require("luasnip.loaders").edit_snippet_files()
end, { nargs = "*", desc = "Edit the available snippets in the filetype" })

command("RemoveEmptyLines", function()
  vim.cmd ":g/^$/d"
  -- :v/./d
  --
  -- :g/^\s*$/d
  -- :v/\S/d
end, { nargs = "*", desc = "Remove all empty lines" })
command("RemoveTrailingSpaces", function()
  vim.cmd ":%s/s+$//e"
end, { nargs = "*", desc = "Remove all trailing spaces " })

function ClickGit()
  local status_ok, _ = pcall(require, "toggleterm")
  if not status_ok then
    return vim.notify "toggleterm.nvim isn't installed!!!"
  end

  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new { cmd = "lazygit", hidden = true }
  lazygit:toggle()
end

function ClickSplit()
  vim.cmd "vsp"
end

-- Function to delete the first buffer if it's empty
-- From: tomando
function DeleteFirstEmptyBuffer()
  local buffers = vim.api.nvim_list_bufs()

  -- Check if there are more than one buffer
  if #buffers > 1 then
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
      local buffer_lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
      -- If it's the first buffer and it's empty, delete it
      if bufnr == 1 and #buffer_lines == 1 and buffer_lines[1] == "" then
        vim.api.nvim_buf_delete(bufnr, { force = false })
        return
      end
    end
  end
end

-- HUUUUUUUUUUUUUUUUUUUUUUUGE kudos and thanks to
-- https://github.com/hown3d for this function <3
local function substitute(cmd)
  cmd = cmd:gsub("%%", vim.fn.expand "%")
  cmd = cmd:gsub("$fileBase", vim.fn.expand "%:r")
  cmd = cmd:gsub("$filePath", vim.fn.expand "%:p")
  cmd = cmd:gsub("$file", vim.fn.expand "%")
  cmd = cmd:gsub("$dir", vim.fn.expand "%:p:h")
  cmd = cmd:gsub("#", vim.fn.expand "#")
  cmd = cmd:gsub("$altFile", vim.fn.expand "#")

  return cmd
end

function RunCode()
  local file_extension = vim.fn.expand "%:e"
  local selected_cmd = ""
  local term_cmd = "bot 10 new | term "
  local supported_filetypes = {
    html = {
      default = "%",
    },
    c = {
      default = "gcc % -o $fileBase && $fileBase",
      debug = "gcc -g % -o $fileBase && $fileBase",
    },
    cs = {
      default = "dotnet run",
    },
    cpp = {
      default = "g++ % -o  $fileBase && $fileBase",
      debug = "g++ -g % -o  $fileBase",
      competitive = "g++ -std=c++17 -Wall -DAL -O2 % -o $fileBase && $fileBase<input.txt",
    },
    py = {
      default = "python %",
    },
    go = {
      default = "go run %",
    },
    java = {
      default = "java %",
    },
    js = {
      default = "node %",
      debug = "node --inspect %",
    },
    ts = {
      default = "tsc % && node $fileBase",
    },
    rs = {
      default = "rustc % && $fileBase",
    },
    php = {
      default = "php %",
    },
    r = {
      default = "Rscript %",
    },
    jl = {
      default = "julia %",
    },
    rb = {
      default = "ruby %",
    },
    pl = {
      default = "perl %",
    },
  }

  if supported_filetypes[file_extension] then
    local choices = vim.tbl_keys(supported_filetypes[file_extension])

    if #choices == 0 then
      vim.notify("It doesn't contain any command", vim.log.levels.WARN, { title = "Code Runner" })
    elseif #choices == 1 then
      selected_cmd = supported_filetypes[file_extension][choices[1]]
      vim.cmd(term_cmd .. substitute(selected_cmd))
    else
      vim.ui.select(choices, { prompt = "Choose a command: " }, function(choice)
        selected_cmd = supported_filetypes[file_extension][choice]
        if selected_cmd then
          vim.cmd(term_cmd .. substitute(selected_cmd))
        end
      end)
    end
  else
    vim.notify("The filetype isn't included in the list", vim.log.levels.WARN, { title = "Code Runner" })
  end
end
