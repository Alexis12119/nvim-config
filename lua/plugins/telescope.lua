---@type NvPluginSpec
-- NOTE: Fuzzy Finder
return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  init = function()
    vim.keymap.set(
      "n",
      "<leader>fa",
      "<cmd>Telescope autocommands<cr>",
      { desc = "Telescope | Autocommands", silent = true }
    )

    vim.keymap.set("n", "<leader>fc", "<cmd>Telescope git_commits<cr>", { desc = "Telescope | Commits", silent = true })

    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope | Files", silent = true })

    -- vim.keymap.set("n", "<leader>fs", "<cmd>Telescope persisted<cr>", { desc = "Telescope | Sessions", silent = true })

    vim.keymap.set("n", "<leader>fm", "<cmd>Telescope marks<cr>", { desc = "Telescope | Marks", silent = true })

    vim.keymap.set("n", "<leader>fM", "<cmd>Telescope man_pages<cr>", { desc = "Telescope | Man Pages", silent = true })

    vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Telescope | Word", silent = true })

    vim.keymap.set("n", "<leader>ft", "<cmd>Telescope themes<cr>", { desc = "Telescope | Themes", silent = true })

    vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Telescope | Buffers", silent = true })

    vim.keymap.set(
      "n",
      "<leader>fn",
      "<cmd>lua require('telescope').extensions.notify.notify()<cr>",
      { desc = "Telescope | Notify History", silent = true }
    )

    vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Telescope | Projects", silent = true })

    vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Telescope | Help", silent = true })

    vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Telescope | Keymaps", silent = true })

    vim.keymap.set("n", "<leader>fC", "<cmd>Telescope commands<cr>", { desc = "Telescope | Commands", silent = true })

    vim.keymap.set(
      "n",
      "<leader>fr",
      "<cmd>Telescope oldfiles<cr>",
      { desc = "Telescope | Recent Files", silent = true }
    )

    vim.keymap.set(
      "n",
      "<leader>fH",
      "<cmd>Telescope highlights<cr>",
      { desc = "Telescope | Highlights", silent = true }
    )

    vim.keymap.set(
      "n",
      "<leader>ls",
      "<cmd>Telescope lsp_document_symbols<cr>",
      { desc = "Telescope | Buffer Symbols", silent = true }
    )

    vim.keymap.set(
      "n",
      "<leader>lS",
      "<cmd>Telescope lsp_workspace_symbols<cr>",
      { desc = "Telescope | Workspace Symbols", silent = true }
    )

    vim.keymap.set(
      "n",
      "<leader>gb",
      "<cmd>Telescope git_branches<cr>",
      { desc = "Telescope | Checkout branch", silent = true }
    )

    vim.keymap.set(
      "n",
      "<leader>gc",
      "<cmd>Telescope git_commits<cr>",
      { desc = "Telescope | Checkout commit", silent = true }
    )
  end,
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      enabled = function()
        return vim.fn.executable "make" == 1
      end,
    },
  },
  opts = {
    pickers = {
      oldfiles = {
        prompt_title = "Recent Files",
      },
      find_files = {
        hidden = true,
      },
    },
    extensions_list = { "themes", "terms", "fzf", "projects" },
    defaults = {
      path_display = { "smart" },
      mappings = {
        i = {
          ["<Tab>"] = require("telescope.actions").move_selection_next,
          ["<S-Tab>"] = require("telescope.actions").move_selection_previous,
          ["<C-j>"] = require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_worse,
          ["<C-k>"] = require("telescope.actions").toggle_selection
            + require("telescope.actions").move_selection_better,
          ["<C-q>"] = require("trouble.sources.telescope").open,
        },
      },
      file_ignore_patterns = { "node_modules", ".git/" },
    },
  },
}
