return {
  "derektata/lorem.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  cmd = { "LoremIpsum" },
  init = function()
    vim.keymap.set("n", "<leader>oL", function()
      vim.ui.input({ prompt = "Number of word(s) / paragraph(s)" }, function(number)
        if number == nil then
          vim.notify("LoremIpsum needs number!", vim.log.levels.WARN, { title = "Lorem" })
          return
        end

        local options = { "words", "paragraphs" }
        vim.ui.select(options, {
          prompt = "Schemes",
          telescope = require("telescope.themes").get_cursor(),
        }, function(selected)
          if selected == nil then
            vim.notify("LoremIpsum needs schemes!", vim.log.levels.WARN, { title = "Lorem" })
            return
          end

          vim.cmd("LoremIpsum " .. number .. " " .. selected)
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
