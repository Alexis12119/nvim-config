local M = {}
local api = vim.api
local strep = string.rep

local get_sidebar_width = function()
  for _, win in pairs(api.nvim_tabpage_list_wins(0)) do
    local buf = api.nvim_win_get_buf(win)

    local filetypes = {
      "NvimTree",
      "neo-tree",
      -- "snacks_picker_list",
    }

    for _, ft in ipairs(filetypes) do
      if ft == vim.bo[buf].ft then
        return api.nvim_win_get_width(win) + 1
      end
    end
  end
  return 0
end

M.modules = {
  treeOffset = function()
    return "%#NvimTreeNormal#" .. strep(" ", get_sidebar_width()) .. "%*"
  end,
}

return M
