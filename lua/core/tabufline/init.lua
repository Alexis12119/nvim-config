local M = {}

M.modules = {
  blank = function()
    return "%#Normal#" .. "%=" -- empty space
  end,
  -- custom_btns = function()
  --   return " %#Normal#%@v:lua.ClickGit@  %#Normal#%@v:lua.RunCode@  %#Normal#%@v:lua.ClickSplit@  "
  -- end,
}

return M
