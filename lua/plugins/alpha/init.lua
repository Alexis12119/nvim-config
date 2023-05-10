return {
  "goolord/alpha-nvim",
  config = function()
    require "plugins.alpha.dashboard"
    local function toggle_alpha()
      if vim.bo.buftype == "" or vim.bo.filetype == "alpha" or vim.bo.filetype == "checkhealth" then
        vim.cmd ":Alpha"
      end
    end

    which_key_add({
      ["a"] = { toggle_alpha, "Alpha" },
    }, "n")
  end,
}
