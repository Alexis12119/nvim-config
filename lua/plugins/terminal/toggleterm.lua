---@type NvPluginSpec
-- NOTE: Terminal Integration
return {
  "akinsho/toggleterm.nvim",
  init = function()
    local utils = require "core.utils"
    vim.keymap.set(
      "n",
      "<leader>tf",
      "<cmd>TermNew direction=float<cr>",
      { desc = "ToggleTerm | New Float Terminal", silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>tF",
      "<cmd>ToggleTerm direction=float<cr>",
      { desc = "ToggleTerm | Toggle Float Terminal", silent = true }
    )

    vim.keymap.set(
      "n",
      "<leader>th",
      "<cmd>TermNew direction=horizontal<cr>",
      { desc = "ToggleTerm | New Horizontal Terminal", silent = true }
    )

    vim.keymap.set(
      "n",
      "<leader>tH",
      "<cmd>ToggleTerm direction=horizontal<cr>",
      { desc = "ToggleTerm | Toggle Horizontal Terminal", silent = true }
    )

    vim.keymap.set(
      "n",
      "<leader>tv",
      "<cmd>TermNew direction=vertical<cr>",
      { desc = "ToggleTerm | New Vertical Terminal", silent = true }
    )

    vim.keymap.set(
      "n",
      "<leader>tV",
      "<cmd>ToggleTerm direction=vertical<cr>",
      { desc = "ToggleTerm | Toggle Vertical Terminal", silent = true }
    )

    vim.keymap.set("n", "<leader>ts", "<cmd>TermSelect<cr>", { desc = "ToggleTerm | Select Terminal", silent = true })
    vim.keymap.set(
      "n",
      "<leader>tt",
      "<cmd>ToggleTermToggleAll<cr>",
      { desc = "ToggleTerm | Toggle/Close All Terminal", silent = true }
    )

    vim.keymap.set("n", "<leader>gg", function()
      utils.git()
    end, { desc = "ToggleTerm | Lazygit", silent = true })

    vim.keymap.set("n", "<leader>td", function()
      utils.docker()
    end, { desc = "ToggleTerm | Docker", silent = true })
  end,
  cmd = {
    "ToggleTerm",
    "TermNew",
    "TermSelect",
    "ToggleTermToggleAll",
    "ToggleTermSendCurrentLine",
    "ToggleTermSendVisualLines",
    "ToggleTermSendVisualSelection",
  },
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return vim.o.lines * 0.4
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.5
      end
    end,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = false,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    autochdir = true,
    highlights = {
      NormalFloat = {
        link = "Normal",
      },
      FloatBorder = {
        link = "FloatBorder",
      },
    },
    float_opts = {
      border = "rounded",
      height = math.ceil(vim.o.lines * 1.0 - 4),
      width = math.ceil(vim.o.columns * 1.0),
      winblend = 0,
    },
  },
}
