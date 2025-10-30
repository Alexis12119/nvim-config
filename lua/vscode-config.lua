vim.o.cmdheight = 0
-- Helper function to call VSCode commands
local function map(mode, lhs, vscode_cmd)
  vim.keymap.set(mode, lhs, function()
    vim.fn.VSCodeNotify(vscode_cmd)
  end, { noremap = true, silent = true })
end

vim.o.clipboard = "unnamedplus"
-- File explorer
map("n", "<leader>e", "workbench.action.toggleSidebarVisibility")

-- Git: view changes
map("n", "<leader>gs", "workbench.view.scm")

-- Toggle terminal
map("n", "<leader>tt", "workbench.action.terminal.toggleTerminal")

-- Comment/uncomment
map("n", "gcc", "editor.action.commentLine")
map("v", "gcc", "editor.action.commentLine")

-- Rename symbol (like LSP rename)
map("n", "<leader>rn", "editor.action.rename")

-- Format document
map("n", "<leader>lf", "editor.action.formatDocument")

-- Close buffer
map("n", "<leader>c", "workbench.action.closeActiveEditor")

-- Previous / Next buffer
map("n", "H", "workbench.action.previousEditor")
map("n", "L", "workbench.action.nextEditor")

-- New / Close tab
map("n", "<Up>", "workbench.action.newWindow")
map("n", "<Down>", "workbench.action.closeWindow")

-- Previous / Next tab
map("n", "<Left>", "workbench.action.previousWindowTab")
map("n", "<Right>", "workbench.action.nextWindowTab")

-- Run Code
map("n", "<leader>nr", "workbench.action.debug.run")

map("n", "gD", "editor.action.goToDeclaration")

-- Jump to definition
map("n", "gd", "editor.action.revealDefinition")

-- Show diagnostics for line
map("n", "gl", "editor.action.showHover") -- closest equivalent in VSCode

-- Peek definition
map("n", "gp", "editor.action.peekDefinition")

-- Hover docs
map("n", "K", "editor.action.showHover")

-- Go to implementations
map("n", "gI", "editor.action.goToImplementation")

-- Code action (normal + visual)
map("n", "<leader>la", "editor.action.quickFix")
map("v", "<leader>la", "editor.action.quickFix")

-- Debug: Continue / Start
map("n", "<leader>dc", "workbench.action.debug.start")

-- Step Over
map("n", "<leader>do", "workbench.action.debug.stepOver")

-- Step Into
map("n", "<leader>di", "workbench.action.debug.stepInto")

-- Step Out
map("n", "<leader>du", "workbench.action.debug.stepOut")

-- Toggle Breakpoint
map("n", "<leader>db", "editor.debug.action.toggleBreakpoint")

-- Conditional Breakpoint
map("n", "<leader>dB", "editor.debug.action.conditionalBreakpoint")

-- Toggle Debug UI (Debug Panel)
map("n", "<leader>dd", "workbench.debug.action.toggleRepl") -- closest to dap-ui

-- Run Last (Restart Debugging)
map("n", "<leader>dl", "workbench.action.debug.restart")

-- Files
map("n", "<leader>ff", "workbench.action.quickOpen") -- Find files
map("n", "<leader>fr", "workbench.action.openRecent") -- Recent files
map("n", "<leader>fb", "workbench.action.showAllEditors") -- Buffers
map("n", "<leader>fB", "workbench.action.quickOpenPreviousRecentlyUsedEditor") -- Previous buffer
map("n", "<leader>fh", "workbench.action.openDocumentationUrl") -- Help docs (closest)

-- Search
map("n", "<leader>fw", "workbench.action.findInFiles") -- Live grep / word
map("n", "<leader>fk", "workbench.action.showCommands") -- Keymaps → Command palette
map("n", "<leader>fC", "workbench.action.showCommands") -- Commands
map("n", "<leader>fH", "editor.action.showHover") -- Highlights (closest)

-- Git
map("n", "<leader>gc", "git.viewHistory") -- Git commits
map("n", "<leader>gb", "git.checkout") -- Git branches

-- LSP
map("n", "<leader>ls", "workbench.action.showAllSymbols") -- Buffer symbols
map("n", "<leader>lS", "workbench.action.showAllSymbols") -- Workspace symbols

-- Misc
map("n", "<leader>fp", "workbench.action.openRecent") -- Projects (recent workspaces)
map("n", "<leader>fm", "workbench.action.gotoSymbol") -- Marks → symbol navigation
map("n", "<leader>fM", "workbench.action.openEditorAtIndex1") -- Man pages (closest: help doc / editor)
map("n", "<leader>ft", "workbench.action.selectTheme") -- Themes
map("n", "<leader>fa", "workbench.action.showCommands") -- Autocommands → command palette
map("n", "<leader>fn", "notifications.showList") -- Notify history
map("n", "<leader>fu", "workbench.action.toggleMaximizedPanel") -- Undo tree (closest: panel toggle)

map("n", "<leader>gd", "git.openChange")
map("n", "<leader>gD", "git.openAllChanges")
