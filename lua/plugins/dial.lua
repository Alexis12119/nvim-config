return {
  "monaqa/dial.nvim",
  init = function()
    vim.keymap.set("n", "<C-a>", function()
      require("dial.map").manipulate("increment", "normal")
    end, { desc = "Dial | Increment", silent = true })
    vim.keymap.set("n", "<C-x>", function()
      require("dial.map").manipulate("decrement", "normal")
    end, { desc = "Dial | Decrement", silent = true })
    vim.keymap.set("n", "g<C-a>", function()
      require("dial.map").manipulate("increment", "gnormal")
    end, { desc = "Dial | Increment", silent = true })
    vim.keymap.set("n", "g<C-x>", function()
      require("dial.map").manipulate("decrement", "gnormal")
    end, { desc = "Dial | Decrement", silent = true })
    vim.keymap.set("v", "<C-a>", function()
      require("dial.map").manipulate("increment", "visual")
    end, { desc = "Dial | Increment", silent = true })
    vim.keymap.set("v", "<C-x>", function()
      require("dial.map").manipulate("decrement", "visual")
    end, { desc = "Dial | Decrement", silent = true })
    vim.keymap.set("v", "g<C-a>", function()
      require("dial.map").manipulate("increment", "gvisual")
    end, { desc = "Dial | Increment", silent = true })
    vim.keymap.set("v", "g<C-x>", function()
      require("dial.map").manipulate("decrement", "gvisual")
    end, { desc = "Dial | Decrement", silent = true })
  end,
  config = function()
    local augend = require "dial.augend"
    require("dial.config").augends:register_group {
      default = {
        -- augend.date.alias["%m/%d/%Y"], -- US date format (Disbled bcs it conflicts with Vietnam format)
        -- augend.date.new { pattern = "%-d/%-m/%-y", default_kind = "day", only_valid = true, word = false }, -- My bruh date format, but it will never work bcs the algorithm?
        -- augend.integer.alias.decimal,
        -- augend.integer.alias.hex,
        augend.constant.alias.bool,
        augend.constant.new { elements = { "&&", "||" }, word = true, cyclic = true },
        augend.constant.new { elements = { "AM", "PM" }, word = true, cyclic = true },
        augend.constant.new { elements = { "Enable", "Disable" }, word = true, cyclic = true },
        augend.constant.new { elements = { "Enabled", "Disabled" }, word = true, cyclic = true },
        augend.constant.new { elements = { "True", "False" }, word = true, cyclic = true },
        augend.constant.new { elements = { "and", "or" }, word = true, cyclic = true },
        augend.constant.new { elements = { "enable", "disable" }, word = true, cyclic = true },
        augend.constant.new { elements = { "enabled", "disabled" }, word = true, cyclic = true },
        augend.constant.new { elements = { "left", "right" }, word = true, cyclic = true },
        augend.constant.new { elements = { "on", "off" }, word = true, cyclic = true },
        augend.constant.new { elements = { "yes", "no" }, word = true, cyclic = true },
        augend.date.alias["%H:%M"], -- Vietnam time format
        augend.date.new { pattern = "%-d/%-m/%Y", default_kind = "day", only_valid = true, word = false }, -- Vietnam date format
        augend.integer.alias.decimal_int,
        augend.semver.alias.semver,
      },
    }
  end,
}
