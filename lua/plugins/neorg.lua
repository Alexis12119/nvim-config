-- NOTE: Note Taking
return {
  "nvim-neorg/neorg",
  enabled = false, -- Disabled by Kev
  dependencies = { "luarocks.nvim" },
  ft = "norg",
  opts = {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.concealer"] = { config = { folds = true, icon_preset = "varied" } }, -- Adds pretty icons to your documents
      ["core.keybinds"] = {
        config = {
          neorg_leader = ",",
        },
      },
      ["core.dirman"] = {
        config = {
          workspaces = {
            notes = "~/notes",
          },
          default_workspace = "notes",
        },
      },
    },
  },
}
