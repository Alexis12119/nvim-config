-- NOTE: Just For Fun Plugin
return {
  "eandrju/cellular-automaton.nvim",
  cmd = "CellularAutomaton",
  init = function()
    vim.keymap.set("n", "<leader>uc", function()
      vim.ui.select({ "scramble", "game_of_life", "make_it_rain" }, {
        prompt = "Select Cellular Automaton",
        telescope = require("telescope.themes").get_dropdown(),
      }, function(selection)
        if selection == nil then
          return
        end
        vim.cmd("CellularAutomaton " .. selection)
      end)
    end, { desc = "CellularAutomaton | Select", silent = true })
  end,
}
