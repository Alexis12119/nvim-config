-- NOTE: Note Taking
return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  ft = "norg",
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {},
        ["core.keybinds"] = {
          config = {
            neorg_leader = ",",
          },
        },
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/notes",
            },
            default_workspace = "notes",
          },
        },
      },
    }

    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
}
