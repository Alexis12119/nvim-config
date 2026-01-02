-- Code running utilities

local M = {}

M.run_code = function()
  local file_extension = vim.fn.expand("%:e")
  local selected_cmd = ""
  local term_cmd = "bot 10 new | term "
  local supported_filetypes = {
    c = {
      default = "gcc % -o $fileBase && $fileBase",
      debug = "gcc -g % -o $fileBase && $fileBase",
    },
    cpp = {
      default = "g++ % -o  $fileBase && $fileBase",
      debug = "g++ -g % -o  $fileBase",
      competitive = "g++ -std=c++17 -Wall -DAL -O2 % -o $fileBase && $fileBase",
    },
    cs = {
      default = "dotnet run",
    },
    go = {
      default = "go run %",
    },
    html = {
      default = "firefox $filePath", -- NOTE: Change this based on your browser that you use
    },
    java = {
      default = "java %",
    },
    jl = {
      default = "julia %",
    },
    js = {
      default = "node %",
      debug = "node --inspect %",
    },
    lua = {
      default = "lua %",
    },
    php = {
      default = "php %",
    },
    pl = {
      default = "perl %",
    },
    py = {
      default = "python3 %",
    },
    r = {
      default = "Rscript %",
    },
    rb = {
      default = "ruby %",
    },
    rs = {
      default = "rustc % && $fileBase",
    },
    ts = {
      default = "tsc % && node $fileBase",
    },
  }

  if supported_filetypes[file_extension] then
    local choices = vim.tbl_keys(supported_filetypes[file_extension])

    if #choices == 0 then
      vim.notify("It doesn't contain any command", vim.log.levels.WARN, { title = "Code Runner" })
    elseif #choices == 1 then
      selected_cmd = supported_filetypes[file_extension][choices[1]]
      vim.cmd(term_cmd .. require("config.utils.substitute").command(selected_cmd))
    else
      vim.ui.select(choices, { prompt = "Choose a command: " }, function(choice)
        selected_cmd = supported_filetypes[file_extension][choice]
        if selected_cmd then
          vim.cmd(term_cmd .. require("config.utils.substitute").command(selected_cmd))
        end
      end)
    end
  else
    vim.notify("The filetype isn't included in the list", vim.log.levels.WARN, { title = "Code Runner" })
  end
end

return M
