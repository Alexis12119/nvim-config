-- Project bootstrapping utilities

local M = {}

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
      name = "  Rust Ecosystem",
      items = {
        { name = "󰣆  Plain Binary (Application)", cmd = "cargo new --bin $project_name" },
        { name = "  Plain Library", cmd = "cargo new --lib $project_name" },
      },
    },
    {
      name = "󰟓  Go Ecosystem",
      items = {
        {
          name = "󰟓  Go Module (CLI/App)",
          cmd = 'mkdir $project_name && cd $project_name && go mod init $project_name && printf \'package main\\n\\nimport "fmt"\\n\\nfunc main() {\\n\\tfmt.Println("Hello, Go!")\\n}\\n\' > main.go',
        },
      },
    },
    {
      name = "  C/C++ Ecosystem",
      items = {
        {
          name = "  Plain C (Makefile)",
          cmd = "mkdir $project_name && cd $project_name && mkdir -p src include && printf '#include <stdio.h>\\n\\nint main() {\\n    printf(\"Hello, World!\\\\n\");\\n    return 0;\\n}\\n' > src/main.c && printf 'CC = gcc\\nCFLAGS = -Iinclude -Wall -Wextra -O2\\nSRC = $(wildcard src/*.c)\\nOBJ = $(SRC:.c=.o)\\nTARGET = main\\n\\nall: $(TARGET)\\n\\n$(TARGET): $(OBJ)\\n\\t$(CC) -o $@ $^\\n\\n%%.o: %%.c\\n\\t$(CC) $(CFLAGS) -c $< -o $@\\n\\nclean:\\n\\trm -f src/*.o $(TARGET)\\n' > Makefile",
        },
        {
          name = "  C++ (CMake)",
          cmd = "mkdir $project_name && cd $project_name && mkdir -p src include && printf '#include <iostream>\\n\\nint main() {\\n    std::cout << \"Hello, C++ World!\" << std::endl;\\n    return 0;\\n}\\n' > src/main.cpp && printf 'cmake_minimum_required(VERSION 3.15)\\nproject($project_name)\\n\\nset(CMAKE_CXX_STANDARD 17)\\nset(CMAKE_CXX_STANDARD_REQUIRED ON)\\n\\ninclude_directories(include)\\n\\nadd_executable($project_name src/main.cpp)\\n' > CMakeLists.txt",
        },
      },
    },
    {
      name = "  Java Ecosystem",
      items = {
        {
          name = "  Plain Java (Maven)",
          cmd = "mvn archetype:generate -DgroupId=com.$project_name -DartifactId=$project_name -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false",
        },
        {
          name = "  Plain Java (Gradle)",
          cmd = "mkdir $project_name && cd $project_name && gradle init --type java-application --package com.$project_name",
        },
        {
          name = "  JavaFX (Maven)",
          cmd = "mvn archetype:generate -DgroupId=com.$project_name -DartifactId=$project_name -DarchetypeGroupId=org.openjfx -DarchetypeArtifactId=javafx-archetype-simple -DarchetypeVersion=0.0.6 -DinteractiveMode=false",
        },
        {
          name = "  JavaFX (Gradle)",
          cmd = "mkdir $project_name && cd $project_name && gradle init --type java-application --package com.$project_name",
        },
        { name = "  Spring Boot", cmd = "springboot" },
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
      name = "  Mobile",
      items = {
        { name = "󰜈  React Native", cmd = "npx react-native init $project_name" },
        { name = "  Flutter", cmd = "flutter create $project_name" },
      },
    },
  }

  -- Spawns background tasks cleanly without messing with active UI buffers
  local function run_in_terminal(dir, cmd, msg)
    vim.notify(msg or ("Running: " .. cmd), vim.log.levels.INFO)

    -- Using the system shell safely to execute the string sequence
    local shell = vim.o.shell
    local shellcmdflag = vim.o.shellcmdflag

    vim.fn.jobstart({ shell, shellcmdflag, string.format("cd %s && %s", vim.fn.shellescape(dir), cmd) }, {
      cwd = dir,
      on_exit = function(_, exit_code, _)
        if exit_code ~= 0 then
          vim.schedule(function()
            vim.notify("󰚌 Bootstrap command failed with exit code " .. exit_code, vim.log.levels.ERROR)
          end)
        end
      end,
    })
  end

  local function ask_git_init(path, framework)
    vim.ui.select({ "Yes", "No" }, { prompt = " Initialize a Git repository?" }, function(choice)
      if choice == "Yes" then
        if vim.fn.isdirectory(path) == 1 then
          local gi_map = {
            ["Next.js"] = "nextjs,node",
            ["React"] = "react,node",
            ["Vite"] = "node",
            ["Astro"] = "node",
            ["SvelteKit"] = "node",
            ["Nuxt.js"] = "node",
            ["Express.js"] = "node",
            ["Fastify"] = "node",
            ["NestJS"] = "nest,node",
            ["Laravel"] = "laravel",
            ["Flask"] = "python,flask",
            ["Django"] = "python,django",
            ["Plain Binary (Application)"] = "rust",
            ["Plain Library"] = "rust",
            ["Go Module (CLI/App)"] = "go",
            ["Plain C (Makefile)"] = "c",
            ["C++ (CMake)"] = "cmake,c++",
            ["Plain Java (Maven)"] = "maven,java",
            ["Plain Java (Gradle)"] = "gradle,java",
            ["JavaFX (Maven)"] = "maven,java",
            ["JavaFX (Gradle)"] = "gradle,java",
            ["Spring Boot"] = "maven,gradle,java",
            ["Remix"] = "node",
            ["T3 Stack"] = "node",
            ["uv"] = "python",
            ["venv"] = "python",
            ["conda"] = "python",
            ["React Native"] = "reactnative,node",
            ["Flutter"] = "flutter,dart",
          }

          local target = gi_map[framework] or ""
          local gi_cmd = ""
          if target ~= "" then
            gi_cmd =
              string.format("curl -sL https://www.toptal.com/developers/gitignore/api/%s > .gitignore && ", target)
          end

          local cmd = string.format(
            "cd %s && %sgit init -q && git add . && git commit -m 'Initial commit' >/dev/null 2>&1",
            path,
            gi_cmd
          )
          os.execute(cmd)
          vim.notify(" Initialized Git repository with .gitignore in " .. path, vim.log.levels.INFO)
        end
      end
    end)
  end

  local function wait_for_project_ready(path, framework, callback)
    local attempts = 0
    local max_attempts = 120
    local timer = vim.loop.new_timer()

    local markers = {
      ["Laravel"] = "artisan",
      ["NestJS"] = "package.json",
      ["Express.js"] = "package.json",
      ["Fastify"] = "package.json",
      ["Next.js"] = "package.json",
      ["React"] = "package.json",
      ["Vite"] = "package.json",
      ["Astro"] = "package.json",
      ["SvelteKit"] = "package.json",
      ["Nuxt.js"] = "package.json",
      ["Nue"] = "package.json",
      ["Flask"] = "app.py",
      ["Django"] = "manage.py",
      ["Plain Binary (Application)"] = "Cargo.toml",
      ["Plain Library"] = "Cargo.toml",
      ["Go Module (CLI/App)"] = "go.mod",
      ["Plain C (Makefile)"] = "Makefile",
      ["C++ (CMake)"] = "CMakeLists.txt",
      ["Spring Boot"] = "pom.xml",
      ["Plain Java (Maven)"] = "pom.xml",
      ["Plain Java (Gradle)"] = "build.gradle",
      ["JavaFX (Maven)"] = "pom.xml",
      ["JavaFX (Gradle)"] = "build.gradle",
      ["Remix"] = "package.json",
      ["T3 Stack"] = "package.json",
      ["uv"] = "pyproject.toml",
      ["venv"] = "venv",
      ["React Native"] = "package.json",
      ["Flutter"] = "pubspec.yaml",
    }

    local marker = markers[framework] or ""

    if timer ~= nil then
      timer:start(2000, 2000, function()
        attempts = attempts + 1
        local ready = false

        if marker ~= "" then
          ready = vim.fn.filereadable(path .. "/" .. marker) == 1
            or vim.fn.filereadable(path .. "/" .. marker .. ".kts") == 1
            or vim.fn.isdirectory(path .. "/" .. marker) == 1
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
  end

  local function finalize_project(target_path, framework, project_name)
    wait_for_project_ready(target_path, framework, function(path)
      vim.cmd("cd " .. path)
      vim.notify("  Changed directory to " .. path, vim.log.levels.INFO)

      local main_files = {
        ["Next.js"] = { "src/app/page.tsx", "app/page.tsx", "src/pages/index.tsx", "pages/index.tsx" },
        ["React"] = { "src/App.tsx", "src/App.js", "src/main.jsx", "src/index.js" },
        ["Vite"] = { "src/App.tsx", "src/App.jsx", "src/main.ts", "src/main.js", "index.html" },
        ["Astro"] = { "src/pages/index.astro" },
        ["SvelteKit"] = { "src/routes/+page.svelte" },
        ["Nuxt.js"] = { "app.vue", "pages/index.vue" },
        ["Nue"] = { "index.html" },
        ["Express.js"] = { "app.js", "index.js", "src/index.js" },
        ["Fastify"] = { "app.js", "server.js" },
        ["NestJS"] = { "src/main.ts" },
        ["Laravel"] = { "routes/web.php" },
        ["Flask"] = { "app.py" },
        ["Django"] = { "manage.py" },
        ["Plain Binary (Application)"] = { "src/main.rs" },
        ["Plain Library"] = { "src/lib.rs" },
        ["Go Module (CLI/App)"] = { "main.go" },
        ["Plain C (Makefile)"] = { "src/main.c" },
        ["C++ (CMake)"] = { "src/main.cpp" },
        ["uv"] = { "src/" .. project_name .. "/__init__.py", "main.py", "src/main.py" },
        ["venv"] = { "main.py" },
        ["conda"] = { "main.py" },
        ["plain"] = { "main.py", "index.js" },
        ["React Native"] = { "App.tsx", "App.js", "index.js" },
        ["Flutter"] = { "lib/main.dart" },
        ["Remix"] = { "app/routes/_index.tsx", "app/root.tsx" },
        ["T3 Stack"] = { "src/pages/index.tsx", "src/app/page.tsx" },
      }

      local opened_file = false

      -- Look for target file
      local target_entry = nil
      if framework:find("Java") or framework:find("Spring Boot") then
        local java_files = vim.fn.glob(path .. "/src/main/java/**/*.java", true, true)
        if #java_files > 0 then
          target_entry = java_files[1]
          for _, file in ipairs(java_files) do
            if file:find("Application%.java$") or file:find("Main%.java$") or file:find("App%.java$") then
              target_entry = file
              break
            end
          end
        end
      else
        local candidates = main_files[framework] or {}
        for _, rel_path in ipairs(candidates) do
          local full_path = path .. "/" .. rel_path
          if vim.fn.filereadable(full_path) == 1 then
            target_entry = full_path
            break
          end
        end
      end

      -- Clear layouts / wipe any existing Alpha dashboards out before jumping to your code
      vim.cmd("only")

      if target_entry then
        vim.cmd("edit " .. vim.fn.fnameescape(target_entry))
        opened_file = true
      end

      if not opened_file then
        if pcall(require, "oil") then
          vim.cmd("Oil " .. path)
        elseif vim.fn.exists(":Neotree") == 2 then
          vim.cmd("Neotree " .. path)
        else
          vim.cmd("Explore " .. path)
        end
      end

      ask_git_init(path, framework)
    end)
  end

  local function choose_framework(category, dir, name, selected)
    local target_path = dir .. "/" .. name

    -- Python Custom Handling
    if category.name:find("Python") then
      run_in_terminal(
        dir,
        selected.cmd:gsub("$project_name", name),
        string.format("  Creating Python project '%s' using %s...", name, selected.name)
      )
      finalize_project(target_path, selected.name, name)
      return
    end

    -- Rust Custom Handling
    if category.name:find("Rust Ecosystem") then
      run_in_terminal(
        dir,
        selected.cmd:gsub("$project_name", name),
        string.format("  Creating Rust project '%s' via %s...", name, selected.name)
      )
      finalize_project(target_path, selected.name, name)
      return
    end

    -- Go Custom Handling
    if category.name:find("Go Ecosystem") then
      run_in_terminal(
        dir,
        selected.cmd:gsub("$project_name", name),
        string.format("󰟓  Creating Go project '%s' via %s...", name, selected.name)
      )
      finalize_project(target_path, selected.name, name)
      return
    end

    -- C / C++ Custom Handling
    if category.name:find("C/C++ Ecosystem") then
      run_in_terminal(
        dir,
        selected.cmd:gsub("$project_name", name),
        string.format("  Creating C/C++ project '%s' using %s...", name, selected.name)
      )
      finalize_project(target_path, selected.name, name)
      return
    end

    -- Java Ecosystem Custom Handling
    if category.name:find("Java Ecosystem") and not selected.name:find("Spring Boot") then
      run_in_terminal(
        dir,
        selected.cmd:gsub("$project_name", name),
        string.format("  Creating Java project '%s' via %s...", name, selected.name)
      )
      finalize_project(target_path, selected.name, name)
      return
    end

    -- Spring Boot Handling
    if selected.name:find("Spring Boot") then
      vim.ui.select({ "Maven", "Gradle (Kotlin)", "Gradle (Groovy)" }, { prompt = "  Choose a build tool:" }, {
        name = name,
      }, function(build_tool)
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
          return vim.fn.system("curl -s https://start.spring.io/metadata/client")
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
                -- Changed from com.example.%s to com.%s to target the structural root cleanly
                local cmd = string.format(
                  "mkdir %s && cd %s && curl -s https://start.spring.io/starter.zip %s -d dependencies=%s -d name=%s -d packageName=com.%s -o %s.zip && unzip %s.zip && rm %s.zip",
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
                finalize_project(target_path, selected.name, name)
              end
            end
          )
        end

        pick_dependencies()
      end)
      return
    end

    -- Laravel Starter Kit Configuration
    if selected.name:find("Laravel") then
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
            finalize_project(target_path, selected.name, name)
          end, 4000)
        end
      )
      return
    end

    -- Default Framework Initialization
    run_in_terminal(
      dir,
      selected.cmd:gsub("$project_name", name),
      string.format("  Creating %s project '%s'...", selected.name, name)
    )
    finalize_project(target_path, selected.name, name)
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

return M
