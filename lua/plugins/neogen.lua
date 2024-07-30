---@type NvPluginSpec
return {
  {
    "danymat/neogen",
    dependencies = {
      "L3MON4D3/LuaSnip",
    },
    cmd = "Neogen",
    config = true,
    init = function()
      vim.keymap.set("n", "<leader>ld", function()
        vim.ui.select({ "auto", "func", "class", "type", "file" }, {
          prompt = "Select Neogen scheme",
          telescope = require("telescope.themes").get_dropdown(),
        }, function(scheme)
          if scheme == nil then
            return
          end
          if scheme == "auto" then
            scheme = ""
          end
          vim.cmd("Neogen" .. " " .. scheme)
        end)
      end, { desc = "Neogen | Generate Docs", silent = true })
    end,
    opts = {
      snippet_engine = "luasnip",
    },
  },
}
