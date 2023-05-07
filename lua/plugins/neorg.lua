return {
  "nvim-neorg/neorg",
  enabled = false,
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              school = "~/notes/school",
            },
          },
        },
      },
    }
  end,
}
