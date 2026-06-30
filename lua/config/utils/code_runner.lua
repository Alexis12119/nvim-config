-- Code running utilities

local M = {}

M.run_code = function()
  local file_extension = vim.fn.expand("%:e")
  local term_cmd = "bot 10 new | term "

  -- Helper to search upwards for project build markers
  local function find_marker(marker)
    return vim.fs.find({ marker }, { upward = true, path = vim.fn.expand("%:p:h") })[1]
  end

  -- Forward declaration for shared JS/TS script parsing
  local run_js_ts

  -- Handles C/C++ compilation dynamically based on project markers
  local function run_c_cpp(single_file_cmd)
    local cmake_path = find_marker("CMakeLists.txt")
    local makefile_path = find_marker("Makefile")

    if cmake_path then
      local project_root = vim.fs.dirname(cmake_path)
      vim.notify("  CMake project detected at root: " .. project_root, vim.log.levels.INFO)
      local cmd = string.format(
        "cd %s && cmake -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON && cmake --build build && ./build/$(grep -oP 'project\\\\(\\\\s*\\\\K[a-zA-Z0-9_-]+' CMakeLists.txt | head -n1)",
        vim.fn.shellescape(project_root)
      )
      vim.cmd(term_cmd .. cmd)
    elseif makefile_path then
      local project_root = vim.fs.dirname(makefile_path)
      vim.notify("  Makefile detected at root: " .. project_root, vim.log.levels.INFO)
      local cmd = string.format(
        "cd %s && make && ./$(grep -oP '^[a-zA-Z0-9_-]+(?=:)' Makefile | grep -v 'all' | grep -v 'clean' | head -n1 || echo 'main')",
        vim.fn.shellescape(project_root)
      )
      vim.cmd(term_cmd .. cmd)
    else
      vim.cmd(term_cmd .. require("config.utils.substitute").command(single_file_cmd))
    end
  end

  -- Handles Go module and hot-reloading environment context
  local function run_go()
    local current_file = vim.fn.expand("%")
    local air_config = find_marker(".air.toml")
    local go_mod = find_marker("go.mod")

    if air_config then
      local project_root = vim.fs.dirname(air_config)
      vim.notify("󰟓  Air configuration found. Starting live reload...", vim.log.levels.INFO)
      vim.cmd(string.format("%s cd %s && air", term_cmd, vim.fn.shellescape(project_root)))
    elseif go_mod then
      local project_root = vim.fs.dirname(go_mod)
      vim.notify("󰟓  Go Module detected. Running from root...", vim.log.levels.INFO)

      local choices = { "󰐊  Run Main Application", "󰛌  Run Module Tests (go test ./...)" }
      vim.ui.select(choices, { prompt = "Go Module Actions:" }, function(choice)
        if choice == choices[1] then
          local entrypoint = vim.fn.filereadable(project_root .. "/main.go") == 1 and "main.go" or "."
          vim.cmd(string.format("%s cd %s && go run %s", term_cmd, vim.fn.shellescape(project_root), entrypoint))
        elseif choice == choices[2] then
          vim.cmd(string.format("%s cd %s && go test ./...", term_cmd, vim.fn.shellescape(project_root)))
        end
      end)
    else
      vim.cmd(term_cmd .. "go run " .. current_file)
    end
  end

  -- Handles .NET C# solutions and project run configurations
  local function run_csharp()
    local current_file = vim.fn.expand("%")
    local proj_marker = vim.fs.find(function(name)
      return name:match("%.csproj$") or name:match("%.sln$")
    end, { upward = true, path = vim.fn.expand("%:p:h") })[1]

    if proj_marker then
      local project_root = vim.fs.dirname(proj_marker)
      vim.notify("󰓦  .NET Environment found at: " .. project_root, vim.log.levels.INFO)

      local choices = { "󰐊  Dotnet Run (Application)", "󰘧  Dotnet Watch (Hot Reload)", "󰛌  Dotnet Test" }
      vim.ui.select(choices, { prompt = "C# Actions:" }, function(choice)
        if choice == choices[1] then
          vim.cmd(string.format("%s cd %s && dotnet run", term_cmd, vim.fn.shellescape(project_root)))
        elseif choice == choices[2] then
          vim.cmd(string.format("%s cd %s && dotnet watch", term_cmd, vim.fn.shellescape(project_root)))
        elseif choice == choices[3] then
          vim.cmd(string.format("%s cd %s && dotnet test", term_cmd, vim.fn.shellescape(project_root)))
        end
      end)
    else
      vim.cmd(string.format("%s dotnet run --project %s", term_cmd, vim.fn.shellescape(current_file)))
    end
  end

  -- Handles HTML previewing and ecosystem-aware asset pipelining
  local function run_html(fallback_cmd)
    local pkg_path = find_marker("package.json")
    if pkg_path then
      run_js_ts(fallback_cmd)
    else
      vim.notify("󰖟  Opening local HTML preview...", vim.log.levels.INFO)
      if vim.fn.executable("npx") == 1 then
        vim.cmd(string.format("%s npx browser-sync start --server --files '%s'", term_cmd, vim.fn.expand("%:p")))
      else
        vim.cmd(term_cmd .. require("config.utils.substitute").command(fallback_cmd))
      end
    end
  end

  -- Handles Python framework execution with automatic virtual environment resolution
  local function run_python()
    local current_file = vim.fn.expand("%")
    local venv_markers = { ".venv", "venv" }
    local venv_path = nil

    for _, marker in ipairs(venv_markers) do
      local found = find_marker(marker)
      if found then
        venv_path = found
        break
      end
    end

    if venv_path then
      local project_root = vim.fs.dirname(venv_path)
      local python_bin = venv_path .. "/bin/python"
      vim.notify("  Using virtual environment: " .. venv_path, vim.log.levels.INFO)

      if find_marker("manage.py") then
        vim.cmd(
          string.format("%s cd %s && %s manage.py runserver", term_cmd, vim.fn.shellescape(project_root), python_bin)
        )
      elseif find_marker("app.py") or find_marker("main.py") then
        local entry = vim.fn.filereadable(project_root .. "/app.py") == 1 and "app.py" or "main.py"
        vim.cmd(string.format("%s cd %s && %s %s", term_cmd, vim.fn.shellescape(project_root), python_bin, entry))
      else
        vim.cmd(string.format("%s %s %s", term_cmd, python_bin, current_file))
      end
    else
      vim.cmd(term_cmd .. "python3 " .. current_file)
    end
  end

  -- Handles JS/TS scripts dynamically by parsing package.json scripts
  run_js_ts = function(fallback_cmd)
    local pkg_path = find_marker("package.json")
    if not pkg_path then
      vim.cmd(term_cmd .. require("config.utils.substitute").command(fallback_cmd))
      return
    end

    local project_root = vim.fs.dirname(pkg_path)
    local file = io.open(pkg_path, "r")
    if not file then
      return
    end
    local content = file:read("*all")
    file:close()

    local ok, parsed = pcall(vim.fn.json_decode, content)
    if not ok or not parsed or not parsed.scripts then
      vim.cmd(term_cmd .. require("config.utils.substitute").command(fallback_cmd))
      return
    end

    local pkg_mgr = "npm"
    if find_marker("pnpm-lock.yaml") then
      pkg_mgr = "pnpm"
    elseif find_marker("yarn.lock") then
      pkg_mgr = "yarn"
    elseif find_marker("bun.lockb") or find_marker("bun.lock") then
      pkg_mgr = "bun"
    end

    local script_keys = vim.tbl_keys(parsed.scripts)
    if #script_keys == 0 then
      vim.cmd(term_cmd .. require("config.utils.substitute").command(fallback_cmd))
      return
    end

    table.sort(script_keys)
    vim.ui.select(script_keys, { prompt = string.format("󰎙  Select %s script to run:", pkg_mgr) }, function(choice)
      if choice then
        local cmd = string.format("cd %s && %s run %s", vim.fn.shellescape(project_root), pkg_mgr, choice)
        vim.cmd(term_cmd .. cmd)
      end
    end)
  end

  -- Handles PHP framework logic (Laravel detection or fallback execution)
  local function run_php()
    local current_file = vim.fn.expand("%")
    local artisan_path = find_marker("artisan")

    if artisan_path then
      local project_root = vim.fs.dirname(artisan_path)
      vim.notify("  Laravel project detected at root: " .. project_root, vim.log.levels.INFO)

      local choices = {
        "󰐊  Start Development Server (artisan serve)",
        "󰛌  Run Database Migrations",
        "󰗨  Run Tests (Pest/PHPUnit)",
      }
      vim.ui.select(choices, { prompt = "Laravel Actions:" }, function(choice)
        if choice == choices[1] then
          vim.cmd(string.format("%s cd %s && php artisan serve", term_cmd, vim.fn.shellescape(project_root)))
        elseif choice == choices[2] then
          vim.cmd(string.format("%s cd %s && php artisan migrate", term_cmd, vim.fn.shellescape(project_root)))
        elseif choice == choices[3] then
          local test_cmd = vim.fn.filereadable(project_root .. "/vendor/bin/pest") == 1 and "./vendor/bin/pest"
            or "./vendor/bin/phpunit"
          vim.cmd(string.format("%s cd %s && %s", term_cmd, vim.fn.shellescape(project_root), test_cmd))
        end
      end)
    else
      vim.cmd(term_cmd .. "php " .. current_file)
    end
  end

  -- Handles Ruby environment structures (Rails vs Bundler standalone vs Raw scripts)
  local function run_ruby()
    local current_file = vim.fn.expand("%")
    local rails_marker = find_marker("bin/rails") or find_marker("config/environment.rb")
    local gemfile_path = find_marker("Gemfile")

    if rails_marker then
      local project_root = vim.fs.dirname(rails_marker:gsub("/bin/rails", ""):gsub("/config/environment.rb", ""))
      vim.notify("  Ruby on Rails application detected!", vim.log.levels.INFO)

      local choices =
        { "󰐊  Start Rails Server", "󰛌  Run Database Migrations (rails db:migrate)", "󰘧  Open Rails Console" }
      vim.ui.select(choices, { prompt = "Rails Actions:" }, function(choice)
        if choice == choices[1] then
          vim.cmd(string.format("%s cd %s && bundle exec rails server", term_cmd, vim.fn.shellescape(project_root)))
        elseif choice == choices[2] then
          vim.cmd(string.format("%s cd %s && bundle exec rails db:migrate", term_cmd, vim.fn.shellescape(project_root)))
        elseif choice == choices[3] then
          vim.cmd(
            string.format("bot 10 new | term cd %s && bundle exec rails console", vim.fn.shellescape(project_root))
          )
        end
      end)
    elseif gemfile_path then
      local project_root = vim.fs.dirname(gemfile_path)
      vim.notify("  Bundler context found. Running with bundle exec...", vim.log.levels.INFO)
      vim.cmd(
        string.format("%s cd %s && bundle exec ruby %s", term_cmd, vim.fn.shellescape(project_root), current_file)
      )
    else
      vim.cmd(term_cmd .. "ruby " .. current_file)
    end
  end

  -- Centralized Dispatch Registry Table
  local supported_filetypes = {
    c = {
      ["󰐊  Run Code"] = function()
        run_c_cpp("gcc % -o $fileBase && $fileBase")
      end,
      ["󆰝  Debug Build"] = "gcc -g % -o $fileBase && $fileBase",
    },
    cpp = {
      ["󰐊  Run Code"] = function()
        run_c_cpp("g++ % -o $fileBase && $fileBase")
      end,
      ["󰘧  Competitive Programming"] = "g++ -std=c++17 -Wall -DAL -O2 % -o $fileBase && $fileBase",
      ["󆰝  Debug Build"] = "g++ -g % -o $fileBase",
    },
    cs = {
      ["󰐊  Run .NET Environment"] = function()
        run_csharp()
      end,
    },
    go = {
      ["󰐊  Run Go Environment"] = function()
        run_go()
      end,
    },
    html = {
      ["󰖟  Open Live Preview"] = function()
        run_html("firefox $filePath")
      end,
    },
    java = {
      ["󰐊  Run Main Class"] = function()
        vim.cmd("JavaRunnerRunMain")
      end,
      ["󰗨  Run with Arguments"] = function()
        vim.ui.input({ prompt = "󰗨  Enter runtime arguments: " }, function(args)
          if args and args ~= "" then
            vim.cmd("JavaRunnerRunMain " .. args)
          elseif args then
            vim.cmd("JavaRunnerRunMain")
          end
        end)
      end,
      ["󰙦  Stop Application"] = function()
        vim.cmd("JavaRunnerStopMain")
      end,
      ["󱂬  Toggle Runner Logs"] = function()
        vim.cmd("JavaRunnerToggleLogs")
      end,
      ["󰒓  Build Workspace"] = function()
        vim.cmd("JavaBuildBuildWorkspace")
      end,
      ["󰛌  Clean Workspace Cache"] = function()
        vim.cmd("JavaBuildCleanWorkspace")
      end,
    },
    jl = { default = "julia %" },
    js = {
      ["󰎙  Run Script / File"] = function()
        run_js_ts("node %")
      end,
      ["󆰝  Debug Run"] = "node --inspect %",
    },
    ts = {
      ["󰎙  Run Script / File"] = function()
        run_js_ts("tsc % && node $fileBase")
      end,
    },
    lua = { default = "lua %" },
    php = {
      ["󰐊  Run PHP Environment"] = function()
        run_php()
      end,
    },
    pl = { default = "perl %" },
    py = {
      ["󰐊  Run Python Environment"] = function()
        run_python()
      end,
    },
    r = { default = "Rscript %" },
    rb = {
      ["󰐊  Run Ruby Environment"] = function()
        run_ruby()
      end,
    },
    rs = { default = "rustc % && $fileBase" },
  }

  if supported_filetypes[file_extension] then
    local choices = vim.tbl_keys(supported_filetypes[file_extension])

    local function execute_action(action)
      if type(action) == "function" then
        action()
      elseif type(action) == "string" then
        vim.cmd(term_cmd .. require("config.utils.substitute").command(action))
      end
    end

    if #choices == 0 then
      vim.notify("It doesn't contain any command", vim.log.levels.WARN, { title = "Code Runner" })
    elseif #choices == 1 then
      local selected_action = supported_filetypes[file_extension][choices[1]]
      execute_action(selected_action)
    else
      -- Skip alphabetic array manipulation for highly custom frameworks
      local specialized = {
        java = true,
        c = true,
        cpp = true,
        js = true,
        ts = true,
        py = true,
        php = true,
        rb = true,
        go = true,
        cs = true,
        html = true,
      }
      if not specialized[file_extension] then
        table.sort(choices)
      end

      vim.ui.select(choices, { prompt = "Choose an action: " }, function(choice)
        if choice then
          local selected_action = supported_filetypes[file_extension][choice]
          execute_action(selected_action)
        end
      end)
    end
  else
    vim.notify("The filetype isn't included in the list", vim.log.levels.WARN, { title = "Code Runner" })
  end
end

return M
