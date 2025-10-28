-- NOTE: Utilities
local M = {}

M.git = function()
  local status_ok, _ = pcall(require, "toggleterm")
  if not status_ok then
    return vim.notify "toggleterm.nvim isn't installed!!!"
  end

  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new { cmd = "lazygit", hidden = true }
  lazygit:toggle()
end

-- HUUUUUUUUUUUUUUUUUUUUUUUGE kudos and thanks to
-- https://github.com/hown3d for this function <3
M.substitute = function(cmd)
  cmd = cmd:gsub("%%", vim.fn.expand "%")
  cmd = cmd:gsub("$fileBase", vim.fn.expand "%:r")
  cmd = cmd:gsub("$filePath", vim.fn.expand "%:p")
  cmd = cmd:gsub("$file", vim.fn.expand "%")
  cmd = cmd:gsub("$dir", vim.fn.expand "%:p:h")
  cmd = cmd:gsub("#", vim.fn.expand "#")
  cmd = cmd:gsub("$altFile", vim.fn.expand "#")
  cmd = cmd:gsub("$project_name", vim.fn.expand "%:t:r") -- for consistency

  return cmd
end

M.bootstrap_project = function()
  local categories = {
    {
      name = "  Frontend",
      items = {
        { name = "  Next.js", cmd = "npx create-next-app@latest $project_name" },
        { name = "  React", cmd = "npx create-react-app $project_name" },
        { name = "  Vite", cmd = "npm create vite@latest $project_name" },
        { name = "  Astro", cmd = "npm create astro@latest $project_name" },
        { name = "  SvelteKit", cmd = "npm create svelte@latest $project_name" },
        { name = "  Nuxt.js", cmd = "npx nuxi init $project_name" },
        { name = "󰡖  Nue", cmd = "nue create $project_name" },
      },
    },
    {
      name = "  Backend",
      items = {
        { name = "  Express.js", cmd = "npx express-generator $project_name" },
        { name = "  Fastify", cmd = "npm create fastify@latest $project_name" },
        { name = "  NestJS", cmd = "npx @nestjs/cli new $project_name" },
        { name = "  Laravel", cmd = "composer create-project laravel/laravel $project_name" },
        { name = "  Spring Boot", cmd = "springboot" },
        {
          name = "  Flask",
          cmd = "mkdir $project_name && cd $project_name && python3 -m venv venv && source venv/bin/activate.fish && pip install flask && echo \"from flask import Flask\\napp = Flask(__name__)\\n@app.route('/')\\ndef home():\\n    return 'Hello, Flask!'\\n\\nif __name__ == '__main__':\\n    app.run(debug=True)\" > app.py",
        },
        {
          name = "  Django",
          cmd = "mkdir $project_name && cd $project_name && python3 -m venv venv && source venv/bin/activate.fish && pip install django && python3 -m django startproject $project_name .",
        },
      },
    },
    {
      name = "  Fullstack",
      items = {
        { name = "󰑷  Remix", cmd = "npx create-remix@latest $project_name" },
        { name = "󰊤  T3 Stack", cmd = "npx create-t3-app@latest $project_name" },
      },
    },
    {
      name = "  Python",
      items = {
        { name = "  uv", cmd = "uv init $project_name" },
        { name = "  venv", cmd = "mkdir $project_name && cd $project_name && python3 -m venv venv" },
        { name = "  conda", cmd = "conda create -y -n $project_name python=3.12" },
        { name = "  plain", cmd = "mkdir $project_name && cd $project_name" },
      },
    },
    {
      name = "󰌛 .NET/C#",
      items = {
        -- Console & Desktop
        { name = "󰌛 Console App", cmd = "dotnet new console -n $project_name" },
        { name = "󰌛 Console App (Top-level)", cmd = "dotnet new console -n $project_name --use-program-main false" },
        { name = "󰌛 Class Library", cmd = "dotnet new classlib -n $project_name" },
        { name = "󰌛 MAUI App", cmd = "dotnet new maui -n $project_name" },
        { name = "󰌛 MAUI Blazor App", cmd = "dotnet new maui-blazor -n $project_name" },
        { name = "󰌛 Avalonia .NET App", cmd = "dotnet new avalonia.app -n $project_name" },
        { name = "󰌛 Avalonia .NET MVVM App", cmd = "dotnet new avalonia.mvvm -n $project_name" },
        { name = "󰌛 Avalonia Cross Platform App", cmd = "dotnet new avalonia.xplat -n $project_name" },
        { name = "󰌛 WPF Application", cmd = "dotnet new wpf -n $project_name" },
        { name = "󰌛 Windows Forms", cmd = "dotnet new winforms -n $project_name" },

        -- Web & API
        { name = "󰌛 ASP.NET Core Web App", cmd = "dotnet new webapp -n $project_name" },
        { name = "󰌛 ASP.NET Core Web API", cmd = "dotnet new webapi -n $project_name" },
        { name = "󰌛 ASP.NET Core Web API (Minimal)", cmd = "dotnet new webapi -n $project_name --use-minimal-apis" },
        { name = "󰌛 ASP.NET Core MVC", cmd = "dotnet new mvc -n $project_name" },
        { name = "󰌛 Blazor Server App", cmd = "dotnet new blazorserver -n $project_name" },
        { name = "󰌛 Blazor WebAssembly App", cmd = "dotnet new blazorwasm -n $project_name" },
        { name = "󰌛 Blazor Web App", cmd = "dotnet new blazor -n $project_name" },
        { name = "󰌛 Razor Class Library", cmd = "dotnet new razorclasslib -n $project_name" },
        { name = "󰌛 gRPC Service", cmd = "dotnet new grpc -n $project_name" },
        { name = "󰌛 Worker Service", cmd = "dotnet new worker -n $project_name" },

        -- Testing
        { name = "󰌛 xUnit Test Project", cmd = "dotnet new xunit -n $project_name" },
        { name = "󰌛 NUnit Test Project", cmd = "dotnet new nunit -n $project_name" },
        { name = "󰌛 MSTest Test Project", cmd = "dotnet new mstest -n $project_name" },

        -- Configuration
        { name = "󰌛 Solution File", cmd = "dotnet new sln -n $project_name" },
        { name = "󰌛 EditorConfig", cmd = "dotnet new editorconfig -n $project_name" },
        { name = "󰌛 Global.json", cmd = "dotnet new globaljson -n $project_name" },
        { name = "󰌛 NuGet Config", cmd = "dotnet new nugetconfig -n $project_name" },
      },
    },
    {
      name = "  Mobile",
      items = {
        { name = "󰜈  React Native", cmd = "npx react-native init $project_name" },
        { name = "  Flutter", cmd = "flutter create $project_name" },
      },
    },
  }

  local function run_in_terminal(dir, cmd, msg)
    vim.notify(msg or ("Running: " .. cmd), vim.log.levels.INFO)
    vim.cmd(string.format("botright 15new | term cd %s && %s", dir, cmd))
  end

  local function ask_git_init(path)
    vim.ui.select({ "Yes", "No" }, { prompt = " Initialize a Git repository?" }, function(choice)
      if choice == "Yes" then
        if vim.fn.isdirectory(path) == 1 then
          local cmd =
            string.format("cd %s && git init -q && git add . && git commit -m 'Initial commit' >/dev/null 2>&1", path)
          os.execute(cmd)
          vim.notify(" Initialized new Git repository in " .. path, vim.log.levels.INFO)
        end
      else
        vim.notify("Skipped Git initialization.", vim.log.levels.INFO)
      end
    end)
  end

  local function wait_for_project_ready(path, framework, callback)
    local attempts = 0
    local max_attempts = 120 -- up to 2 minutes
    local timer = vim.loop.new_timer()

    local markers = {
      ["Laravel"] = "artisan",
      ["NestJS"] = "package.json",
      ["Express.js"] = "package.json",
      ["Fastify"] = "package.json",
      ["Next.js"] = "package.json",
      ["React"] = "package.json",
      ["Vite"] = "package.json",
      ["Remix"] = "package.json",
      ["T3 Stack"] = "package.json",
      ["Flask"] = "app.py",
      ["Django"] = "manage.py",
      ["uv"] = "pyproject.toml",
      ["Spring Boot"] = "pom.xml",
    }

    local marker = markers[framework] or ""

    timer:start(2000, 2000, function()
      attempts = attempts + 1
      local ready = false

      if marker ~= "" then
        ready = vim.fn.filereadable(path .. "/" .. marker) == 1
      else
        ready = vim.fn.isdirectory(path) == 1
      end

      if ready then
        vim.schedule(function()
          vim.notify("  Project ready: " .. path, vim.log.levels.INFO)
          timer:stop()
          timer:close()
          callback(path)
        end)
      elseif attempts >= max_attempts then
        vim.schedule(function()
          vim.notify("  Timeout waiting for project to finish setup: " .. path, vim.log.levels.WARN)
        end)
        timer:stop()
        timer:close()
      end
    end)
  end

  local function finalize_project(target_path, framework)
    wait_for_project_ready(target_path, framework, function(path)
      vim.cmd("cd " .. path)
      vim.notify("  Changed directory to " .. path, vim.log.levels.INFO)
      ask_git_init(path)
    end)
  end

  local function choose_framework(category, dir, name, selected)
    local target_path = dir .. "/" .. name

    -- Python
    if category.name:find "Python" then
      run_in_terminal(
        dir,
        selected.cmd:gsub("$project_name", name),
        string.format("  Creating Python project '%s' using %s...", name, selected.name)
      )
      finalize_project(target_path, selected.name)
      return
    end

    -- Spring Boot
    if selected.name:find "Spring Boot" then
      vim.ui.select(
        { "Maven", "Gradle (Kotlin)", "Gradle (Groovy)" },
        { prompt = "  Choose a build tool:" },
        function(build_tool)
          if not build_tool then
            return
          end

          local type_flag = ""
          if build_tool == "Maven" then
            type_flag = "-d type=maven-project"
          elseif build_tool == "Gradle (Kotlin)" then
            type_flag = "-d type=gradle-kotlin-dsl"
          elseif build_tool == "Gradle (Groovy)" then
            type_flag = "-d type=gradle-project"
          end

          vim.notify("  Selected " .. build_tool, vim.log.levels.INFO)
          vim.notify("  Fetching available Spring Boot dependencies...", vim.log.levels.INFO)

          local ok, metadata_json = pcall(function()
            return vim.fn.system "curl -s https://start.spring.io/metadata/client"
          end)
          if not ok or metadata_json == "" then
            vim.notify("  Failed to fetch Spring Boot metadata!", vim.log.levels.ERROR)
            return
          end

          local ok2, metadata = pcall(vim.fn.json_decode, metadata_json)
          if not ok2 or not metadata or not metadata.dependencies then
            vim.notify("  Could not parse Spring Boot metadata.", vim.log.levels.ERROR)
            return
          end

          local deps = {}
          for _, group in ipairs(metadata.dependencies.values) do
            for _, dep in ipairs(group.values or {}) do
              table.insert(deps, {
                label = string.format("%-25s — %s", dep.id, dep.name or dep.description or ""),
                id = dep.id,
              })
            end
          end

          if #deps == 0 then
            vim.notify("  No dependencies found from Spring Initializr!", vim.log.levels.WARN)
            return
          end

          local selected_deps = {}
          local function pick_dependencies()
            vim.ui.select(
              vim.tbl_map(function(d)
                return d.label
              end, deps),
              { prompt = "  Select dependencies (Enter to confirm, ESC when done)", kind = "multi" },
              function(choice)
                if choice then
                  local dep = vim.tbl_filter(function(d)
                    return d.label == choice
                  end, deps)[1]
                  if dep then
                    table.insert(selected_deps, dep.id)
                  end
                  pick_dependencies()
                else
                  local deps_str = table.concat(selected_deps, ",")
                  local cmd = string.format(
                    "mkdir %s && cd %s && curl -s https://start.spring.io/starter.zip %s -d dependencies=%s -d name=%s -d packageName=com.example.%s -o %s.zip && unzip %s.zip && rm %s.zip",
                    name,
                    name,
                    type_flag,
                    deps_str ~= "" and deps_str or "web",
                    name,
                    name,
                    name,
                    name,
                    name
                  )
                  run_in_terminal(dir, cmd, "  Creating Spring Boot project '" .. name .. "'...")
                  finalize_project(target_path, selected.name)
                end
              end
            )
          end

          pick_dependencies()
        end
      )
      return
    end

    -- Laravel
    if selected.name:find "Laravel" then
      local kits = {
        { name = "None (Vanilla Laravel)", cmd = "" },
        { name = "Breeze (Blade)", cmd = "composer require laravel/breeze --dev && php artisan breeze:install blade" },
        { name = "Breeze (Vue)", cmd = "composer require laravel/breeze --dev && php artisan breeze:install vue" },
        { name = "Breeze (React)", cmd = "composer require laravel/breeze --dev && php artisan breeze:install react" },
        {
          name = "Jetstream (Livewire)",
          cmd = "composer require laravel/jetstream && php artisan jetstream:install livewire",
        },
        {
          name = "Jetstream (Vue)",
          cmd = "composer require laravel/jetstream && php artisan jetstream:install inertia --stack=vue",
        },
        {
          name = "Jetstream (React)",
          cmd = "composer require laravel/jetstream && php artisan jetstream:install inertia --stack=react",
        },
        {
          name = "Bootstrapped Breeze",
          cmd = "composer require laravel/breeze --dev && php artisan breeze:install blade --bootstrap",
        },
      }

      vim.ui.select(
        vim.tbl_map(function(k)
          return k.name
        end, kits),
        { prompt = "  Choose a Laravel Starter Kit:" },
        function(kit_choice)
          if not kit_choice then
            return
          end
          local kit = vim.tbl_filter(function(k)
            return k.name == kit_choice
          end, kits)[1]

          run_in_terminal(
            dir,
            selected.cmd:gsub("$project_name", name),
            "  Creating Laravel project '" .. name .. "'..."
          )

          vim.defer_fn(function()
            if kit and kit.cmd ~= "" then
              run_in_terminal(
                target_path,
                kit.cmd .. " && npm install && npm run build",
                "Installing Laravel Starter Kit: " .. kit_choice
              )
            end
            finalize_project(target_path, selected.name)
          end, 4000)
        end
      )
      return
    end

    -- Default
    run_in_terminal(
      dir,
      selected.cmd:gsub("$project_name", name),
      string.format("  Creating %s project '%s'...", selected.name, name)
    )
    finalize_project(target_path, selected.name)
  end

  vim.ui.select(
    vim.tbl_map(function(c)
      return c.name
    end, categories),
    { prompt = "Select a project category:" },
    function(category_choice)
      if not category_choice then
        return
      end
      local category = vim.tbl_filter(function(c)
        return c.name == category_choice
      end, categories)[1]
      if not category then
        return
      end

      local function pick_framework(selected)
        vim.ui.input({ prompt = "Project name:" }, function(name)
          if not name or name == "" then
            return
          end
          vim.ui.input({ prompt = "Target directory (default: cwd):", default = vim.fn.getcwd() }, function(dir)
            dir = (dir and dir ~= "") and dir or vim.fn.getcwd()
            choose_framework(category, dir, name, selected)
          end)
        end)
      end

      if #category.items == 1 then
        pick_framework(category.items[1])
      else
        vim.ui.select(
          vim.tbl_map(function(f)
            return f.name
          end, category.items),
          { prompt = "Choose a framework to bootstrap:" },
          function(framework_choice)
            if not framework_choice then
              return
            end
            local selected = vim.tbl_filter(function(f)
              return f.name == framework_choice
            end, category.items)[1]
            if selected then
              pick_framework(selected)
            end
          end
        )
      end
    end
  )
end

M.run_code = function()
  local file_extension = vim.fn.expand "%:e"
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
      vim.cmd(term_cmd .. M.substitute(selected_cmd))
    else
      vim.ui.select(choices, { prompt = "Choose a command: " }, function(choice)
        selected_cmd = supported_filetypes[file_extension][choice]
        if selected_cmd then
          vim.cmd(term_cmd .. M.substitute(selected_cmd))
        end
      end)
    end
  else
    vim.notify("The filetype isn't included in the list", vim.log.levels.WARN, { title = "Code Runner" })
  end
end

return M
