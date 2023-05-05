return {
  "nvim-neorg/neorg",
  ft = "norg",
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
