local keymap = vim.keymap.set
-- keymap("n", "gD", vim.lsp.buf.declaration, buf_{})
keymap("n", "gD", "<cmd>Lspsaga finder<cr>", { desc = "LSP | Finder"})
keymap("n", "gd", "<cmd>Lspsaga goto_definition<cr>", { desc = "LSP | Definition" })
keymap("n", "<leader>la", vim.lsp.buf.code_action, { desc = "LSP | Code Action" })
keymap("n", "gl", "<cmd>Lspsaga show_line_diagnostics<cr>", { desc = "LSP | Show Line Diagnostics" })
keymap("n", "gp", "<cmd>Lspsaga peek_definition<cr>", { desc = "LSP | Peek Definition" })
keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", { desc = "LSP | Hover Doc" })
keymap("n", "gI", "<cmd>Telescope lsp_implementations<cr>", { desc = "LSP | Implementations" })
