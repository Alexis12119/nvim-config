---@type LazySpec
-- NOTE: For .NET Development
return {
  "GustavEikaas/easy-dotnet.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>cDd",
      function()
        vim.cmd("Dotnet ef database update")
      end,
      desc = "Dotnet: EF Database Update",
    },
    {
      "<leader>cDdD",
      function()
        vim.cmd("Dotnet ef database drop")
      end,
      desc = "Dotnet: EF Database Drop",
    },
    {
      "<leader>cDma",
      function()
        vim.cmd("Dotnet ef migrations add")
      end,
      desc = "Dotnet: EF Add Migration",
    },
    {
      "<leader>cDmr",
      function()
        vim.cmd("Dotnet ef migrations remove")
      end,
      desc = "Dotnet: EF Remove Migration",
    },
    {
      "<leader>cDml",
      function()
        vim.cmd("Dotnet ef migrations list")
      end,
      desc = "Dotnet: EF List Migrations",
    },
    {
      "<leader>cDb",
      function()
        vim.cmd("Dotnet build quickfix")
      end,
      desc = "Dotnet: Build Project",
    },
    {
      "<leader>cDr",
      function()
        vim.cmd("Dotnet run")
      end,
      desc = "Dotnet: Run Project",
    },
    {
      "<leader>cDw",
      function()
        vim.cmd("Dotnet watch")
      end,
      desc = "Dotnet: Run with Watch",
    },
    {
      "<leader>cDt",
      function()
        vim.cmd("Dotnet test")
      end,
      desc = "Dotnet: Run Tests",
    },
    {
      "<leader>cDlr",
      function()
        vim.cmd("Dotnet lsp restart")
      end,
      desc = "Dotnet: Restart LSP",
    },
    {
      "<leader>cDls",
      function()
        vim.cmd("Dotnet lsp start")
      end,
      desc = "Dotnet: Start LSP",
    },
    {
      "<leader>cDlx",
      function()
        vim.cmd("Dotnet lsp stop")
      end,
      desc = "Dotnet: Stop LSP",
    },
    {
      "<leader>cDP",
      function()
        vim.cmd("Dotnet project view")
      end,
      desc = "Dotnet: Project View",
    },
    {
      "<leader>cDpo",
      function()
        vim.cmd("Dotnet outdated")
      end,
      desc = "Dotnet: Check Outdated Packages",
    },
    {
      "<leader>cDpp",
      function()
        vim.cmd("Dotnet pack")
      end,
      desc = "Dotnet: Pack Project",
    },
    {
      "<leader>cDpP",
      function()
        vim.cmd("Dotnet push")
      end,
      desc = "Dotnet: Push Package",
    },
    {
      "<leader>cDc",
      function()
        vim.cmd("Dotnet clean")
      end,
      desc = "Dotnet: Clean Project",
    },
    {
      "<leader>cDR",
      function()
        vim.cmd("Dotnet restore")
      end,
      desc = "Dotnet: Restore Packages",
    },
    {
      "<leader>cDn",
      function()
        vim.cmd("Dotnet new")
      end,
      desc = "Dotnet: New Project",
    },
    {
      "<leader>cDg",
      function()
        vim.cmd("checkhealth easy-dotnet")
      end,
      desc = "Dotnet: Check Health",
    },
    {
      "<leader>cDdS",
      function()
        vim.cmd("Dotnet diagnostic")
      end,
      desc = "Dotnet: Diagnostics",
    },
    {
      "<leader>cDde",
      function()
        vim.cmd("Dotnet diagnostic errors")
      end,
      desc = "Dotnet: Diagnostic Errors",
    },
    {
      "<leader>cDdw",
      function()
        vim.cmd("Dotnet diagnostic warnings")
      end,
      desc = "Dotnet: Diagnostic Warnings",
    },
  },
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "folke/which-key.nvim",
      optional = true,
      opts = {
        spec = {
          { "<leader>cD", group = ".NET" },
          { "<leader>cDd", group = "Database" },
          { "<leader>cDm", group = "Migrations" },
          { "<leader>cDl", group = "LSP" },
          { "<leader>cDp", group = "Package" },
        },
      },
    },
  },
}
