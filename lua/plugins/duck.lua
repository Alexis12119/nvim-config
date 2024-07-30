---@type NvPluginSpec
-- NOTE: Just For Fun Plugin
return {
  "tamton-aquib/duck.nvim",
  init = function()
    vim.keymap.set("n", "<leader>uD", function()
      vim.ui.select({ "hatch", "cook", "cook_all" }, {
        prompt = "Select Duck",
        telescope = require("telescope.themes").get_dropdown(),
      }, function(selection)
        if selection == nil then
          return
        end
        vim.cmd('lua require("duck").' .. selection .. "()")
      end)
    end, { desc = "Duck | Select", silent = true })
  end,
}
