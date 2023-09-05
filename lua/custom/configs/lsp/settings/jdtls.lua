-- -- jdtls configuration is now on ftplugin/java.lua

-- local home = vim.env.HOME
-- local jdtls_path = vim.fn.stdpath "data" .. "/mason/packages/jdtls/"
-- local equinox_version = "1.6.400.v20210924-0641"

-- WORKSPACE_PATH = home .. "/workspace/"
-- if vim.fn.has "mac" == 1 then
--   OS_NAME = "mac"
-- elseif vim.fn.has "unix" == 1 then
--   OS_NAME = "linux"
-- elseif vim.fn.has "win32" == 1 then
--   OS_NAME = "win"
-- else
--   vim.notify("Unsupported OS", vim.log.levels.WARN, { title = "Jdtls" })
-- end

-- -- local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }

-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

-- local workspace_dir = WORKSPACE_PATH .. project_name

-- return {
--   cmd = {
--     -- 💀
--     "java", -- or '/path/to/java17_or_newer/bin/java'
--     -- depends on if `java` is in your $PATH env variable and if it points to the right version.

--     "-Declipse.application=org.eclipse.jdt.ls.core.id1",
--     "-Dosgi.bundles.defaultStartLevel=4",
--     "-Declipse.product=org.eclipse.jdt.ls.core.product",
--     "-Dlog.protocol=true",
--     "-Dlog.level=ALL",
--     "-Xms1g",
--     "--add-modules=ALL-SYSTEM",
--     "--add-opens",
--     "java.base/java.util=ALL-UNNAMED",
--     "--add-opens",
--     "java.base/java.lang=ALL-UNNAMED",
--     -- 💀
--     "-jar",
--     jdtls_path .. "plugins/org.eclipse.equinox.launcher_" .. equinox_version .. ".jar",
--     -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
--     -- Must point to the                                                     Change this to
--     -- eclipse.jdt.ls installation                                           the actual version
--     -- 💀
--     "-configuration",
--     jdtls_path .. "config_" .. OS_NAME,
--     -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
--     -- Must point to the                      Change to one of `linux`, `win` or `mac`
--     -- eclipse.jdt.ls installation            Depending on your system.

--     "-data",
--     workspace_dir,
--   },
-- }
return {}
