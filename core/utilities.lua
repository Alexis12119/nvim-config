-- #############################
-- #   Utilities  and Commands #
-- #############################

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
  vim.cmd "sp"
end

function ClickUpdate()
  -- Inspired by NvChad/ui (https://github.com/NvChad/ui)
  dofile(vim.g.base46_cache .. "nvchad_updater")
  local nvchad_config = vim.fn.stdpath "config"
  local config_path = vim.fn.stdpath "config" .. "/lua/custom"
  local config_branch = "main"

  local api = vim.api

  local spinners = { "", "󰪞", "󰪟", "󰪠", "󰪢", "󰪣", "󰪤", "󰪥" }
  -- local spinners = { "󰸶", "󰸸", "󰸷", "󰸴", "󰸵", "󰸳" }
  -- local spinners = { "", "", "", "󰺕", "", "" }
  local content = { " ", " ", "" }
  local header = " 󰓂 Update status "

  -- create buffer
  local buf = vim.api.nvim_create_buf(false, true)

  vim.cmd "sp"

  vim.api.nvim_set_current_buf(buf)

  -- local options
  vim.opt_local.buflisted = false
  vim.opt_local.number = false
  vim.opt_local.list = false
  vim.opt_local.relativenumber = false
  vim.opt_local.wrap = false
  vim.opt_local.cul = false

  -- set lines & highlight for updater title
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)
  local nvUpdater = api.nvim_create_namespace "nvUpdater"
  api.nvim_buf_add_highlight(buf, nvUpdater, "nvUpdaterTitle", 1, 0, -1)

  local git_outputs = {} -- list of commits fill here after 3-4 seconds

  -- update spinner icon until git_outputs is empty
  -- use a timer
  local index = 0

  local timer = vim.loop.new_timer()

  timer:start(0, 100, function()
    if #git_outputs ~= 0 then
      timer:stop()
    end

    vim.schedule(function()
      if #git_outputs == 0 then
        content[2] = header .. " " .. spinners[index % #spinners + 1] .. "  "
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)
        api.nvim_buf_add_highlight(buf, nvUpdater, "nvUpdaterTitle", 1, 0, #header)
        api.nvim_buf_add_highlight(buf, nvUpdater, "nvUpdaterProgress", 1, #header, -1)
      end
    end)

    index = index + 1
  end)

  local git_fetch_err = false

  local function get_commits_data()
    -- set lines & highlights
    -- using vim.schedule because we cant use set_lines & systemlist in callback
    vim.schedule(function()
      if not git_fetch_err then
        local head_hash = vim.fn.systemlist("git -C " .. config_path .. " rev-parse HEAD")

        -- git log --format="format:%h: %s"  HEAD..origin/somebranch
        git_outputs = vim.fn.systemlist(
          "git -C " .. config_path .. ' log --format="format:%h: %s" ' .. head_hash[1] .. "..origin/" .. config_branch
        )

        if #git_outputs == 0 then
          git_outputs = { "Already updated!" }
        end
      end

      -- add icon to sentences
      for i, value in ipairs(git_outputs) do
        -- remove : after commit hash too
        git_outputs[i] = "  " .. value:gsub(":", "")
      end

      local success_update = " 󰓂 Update status    "
      local failed_update = " 󰓂 Update status  󰚌 "

      content[2] = git_fetch_err and failed_update or success_update

      -- append gitpull table to content table
      for i = 1, #git_outputs, 1 do
        content[#content + 1] = git_outputs[i]
      end

      -- draw the output on buffer
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)

      local title_hl = "nvUpdaterTitle" .. (git_fetch_err and "FAIL" or "DONE")
      local progress_hl = "nvUpdaterProgress" .. (git_fetch_err and "FAIL" or "DONE")

      -- highlight title & finish icon
      api.nvim_buf_add_highlight(buf, nvUpdater, title_hl, 1, 0, #header)
      api.nvim_buf_add_highlight(buf, nvUpdater, progress_hl, 1, #header, -1)

      -- 7 = length of git commit hash aliases + 1 :
      for i = 3, #content do
        api.nvim_buf_add_highlight(buf, nvUpdater, (git_fetch_err and "nvUpdaterFAIL" or "nvUpdaterCommits"), i, 2, 13)
      end

      -- Update to the latest NvChad commits
      vim.fn.system("git -C " .. nvchad_config .. " pull")

      -- Fetch the latest changes from the remote repository
      vim.fn.system("git -C " .. config_path .. " fetch origin")

      -- Hard reset to the latest commit on the main branch
      vim.fn.system("git -C " .. config_path .. " reset --hard origin/" .. config_branch)

      -- Pull the latest changes
      vim.fn.system("git -C " .. config_path .. " pull origin " .. config_branch)
    end)
  end

  vim.fn.jobstart({ "git", "fetch" }, {
    cwd = config_path,
    on_exit = function(_, code, _)
      get_commits_data()

      if code ~= 0 then
        git_fetch_err = true
        git_outputs[#git_outputs + 1] = "Failed to update "
        print(" error " .. code)
      end
    end,
  })
end

-- HUUUUUUUUUUUUUUUUUUUUUUUGE kudos and thanks to
-- https://github.com/hown3d for this function <3
-- local function substitute(cmd)
--   cmd = cmd:gsub("%%", vim.fn.expand "%")
--   cmd = cmd:gsub("$fileBase", vim.fn.expand "%:r")
--   cmd = cmd:gsub("$filePath", vim.fn.expand "%:p")
--   cmd = cmd:gsub("$file", vim.fn.expand "%")
--   cmd = cmd:gsub("$dir", vim.fn.expand "%:p:h")
--   cmd = cmd:gsub("#", vim.fn.expand "#")
--   cmd = cmd:gsub("$altFile", vim.fn.expand "#")

--   return cmd
-- end

-- function RunCode()
--   local file_extension = vim.fn.expand "%:e"
--   local selected_cmd = ""
--   local term_cmd = "bot 10 new | term "
--   local supported_filetypes = {
--     html = {
--       default = "%",
--     },
--     c = {
--       default = "gcc % -o $fileBase && $fileBase",
--       debug = "gcc -g % -o $fileBase && $fileBase",
--     },
--     cs = {
--       default = "dotnet run",
--     },
--     cpp = {
--       default = "g++ % -o  $fileBase && $fileBase",
--       debug = "g++ -g % -o  $fileBase",
--       competitive = "g++ -std=c++17 -Wall -DAL -O2 % -o $fileBase && $fileBase<input.txt",
--     },
--     py = {
--       default = "python %",
--     },
--     go = {
--       default = "go run %",
--     },
--     java = {
--       default = "java %",
--     },
--     js = {
--       default = "node %",
--       debug = "node --inspect %",
--     },
--     ts = {
--       default = "tsc % && node $fileBase",
--     },
--     rs = {
--       default = "rustc % && $fileBase",
--     },
--     php = {
--       default = "php %",
--     },
--     r = {
--       default = "Rscript %",
--     },
--     jl = {
--       default = "julia %",
--     },
--     rb = {
--       default = "ruby %",
--     },
--     pl = {
--       default = "perl %",
--     },
--   }

--   if supported_filetypes[file_extension] then
--     local choices = vim.tbl_keys(supported_filetypes[file_extension])

--     if #choices == 0 then
--       vim.notify("It doesn't contain any command", vim.log.levels.WARN, { title = "Code Runner" })
--     elseif #choices == 1 then
--       selected_cmd = supported_filetypes[file_extension][choices[1]]
--       vim.cmd(term_cmd .. substitute(selected_cmd))
--     else
--       vim.ui.select(choices, { prompt = "Choose a command: " }, function(choice)
--         selected_cmd = supported_filetypes[file_extension][choice]
--         if selected_cmd then
--           vim.cmd(term_cmd .. substitute(selected_cmd))
--         end
--       end)
--     end
--   else
--     vim.notify("The filetype isn't included in the list", vim.log.levels.WARN, { title = "Code Runner" })
--   end
-- end
