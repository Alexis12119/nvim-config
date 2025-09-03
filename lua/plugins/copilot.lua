---@type NvPluginSpec
-- NOTE: AI Provider for Avante

return {
  "zbirenbaum/copilot.lua",
  enabled = false,
  opts = {
    filetypes = {
      ["*"] = false,
      sh = function()
        if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
          -- disable for .env files
          return false
        end
        return true
      end,
    },
  },
}
