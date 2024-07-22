return {
  "derektata/lorem.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  cmd = { "LoremIpsum" },
  init = function()
    vim.keymap.set("n", "<leader>ul", function()
      vim.ui.input({ prompt = "Enter number of word(s) / paragraph(s)" }, function(number)
        number = number ~= nil and number or ""
        vim.ui.select({ "words", "paragraphs" }, {
          prompt = "Select Lorem scheme",
          telescope = require("telescope.themes").get_dropdown(),
        }, function(scheme)
          if scheme == nil then
            return
          end
          vim.cmd("LoremIpsum " .. number .. " " .. scheme)
        end)
      end)
    end, { desc = "Lorem | Generate", silent = true })
  end,
  opts = {
    sentenceLength = "medium",
    comma_chance = 0.2,
    max_commas_per_sentence = 2,
  },
  config = function(_, opts)
    require("lorem").setup(opts)
  end,
}
