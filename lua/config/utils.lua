-- NOTE: Utilities - Main module that imports and re-exports from modular files
local M = {}

-- Import all utility modules
local substitute = require("config.utils.substitute")
local project_bootstrap = require("config.utils.project_bootstrap")
local code_runner = require("config.utils.code_runner")
local eslint = require("config.utils.eslint")
local theme_picker = require("config.utils.theme_picker")

-- Re-export functions from modules
M.substitute = substitute.command
M.bootstrap_project = project_bootstrap.bootstrap_project
M.run_code = code_runner.run_code
M.pick_eslint_config = eslint.pick_eslint_config
M.lint_project = eslint.lint_project
M.theme_picker = theme_picker

return M
