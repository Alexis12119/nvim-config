-- Theme picker utilities

local M = {}

-- Internal function: apply theme immediately
local function apply_theme(name)
  require("nvconfig").base46.theme = name
  require("base46").load_all_highlights()
end

-- Open the theme picker
function M.open()
  local Snacks = require("snacks")
  local bufnr = vim.api.nvim_get_current_buf()
  local themes = require("nvchad.utils").list_themes()
  local original = require("nvconfig").base46.theme

  Snacks.picker.pick({
    source = "NvChad Themes",

    finder = function()
      local items = {}
      for _, theme in ipairs(themes) do
        table.insert(items, {
          text = theme,
          value = theme,
        })
      end
      return items
    end,

    on_change = function(_, item)
      if item and item.value then
        apply_theme(item.value)
      end
    end,

    preview = function(ctx)
      vim.bo[ctx.buf].modifiable = true

      local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
      vim.api.nvim_buf_set_lines(ctx.buf, 0, -1, false, lines)

      local ft = (vim.filetype.match({ buf = bufnr }) or "diff"):match("%w+")
      vim.bo[ctx.buf].filetype = ft

      vim.bo[ctx.buf].modifiable = false
    end,

    confirm = function(picker, item)
      picker:close()
      if not item or not item.value then
        return
      end

      package.loaded.chadrc = nil
      local old = '"' .. require("chadrc").base46.theme .. '"'
      local new = '"' .. item.value .. '"'
      require("nvchad.utils").replace_word(old, new)
    end,

    cancel = function()
      apply_theme(original)
    end,

    format = function(item)
      return {
        { "  " .. item.text },
      }
    end,

    layout = {
      preview = true,
      box = "horizontal",
      width = 0.8,
      height = 0.8,
      border = "rounded",
    },
  })
end

-- Theme picker module
M.theme_picker = {
  open = M.open
}

return M