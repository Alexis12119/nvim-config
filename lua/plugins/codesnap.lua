local ask_ext = function(cmd)
  vim.ui.input({ prompt = "Specify Code Extension (optional)" }, function(ext)
    vim.cmd(cmd .. " " .. ext)
  end)
end

---@type NvPluginSpec
return {
  "mistricky/codesnap.nvim",
  enabled = vim.fn.has "win32" == 0,
  build = "make",
  init = function()
    vim.keymap.set("x", "<leader>ss", function()
      ask_ext "CodeSnap"
    end, { desc = "CodeSnap | Save to Clipboard", silent = true })
    vim.keymap.set("x", "<leader>ss", function()
      ask_ext "CodeSnapSave"
    end, { desc = "CodeSnap | Save", silent = true })
    vim.keymap.set("x", "<leader>sa", function()
      ask_ext "CodeSnapASCII"
    end, { desc = "CodeSnap | Save ASCII to Clipboard", silent = true })
    vim.keymap.set("x", "<leader>sh", function()
      ask_ext "CodeSnapHighlight"
    end, { desc = "CodeSnap | Save Highlight to Clipboard", silent = true })
    vim.keymap.set("x", "<leader>sH", function()
      ask_ext "CodeSnapSaveHighlight"
    end, { desc = "CodeSnap | Save Highlight", silent = true })
  end,
  cmd = {
    "CodeSnap",
    "CodeSnapSave",
    "CodeSnapASCII",
    "CodeSnapHighlight",
    "CodeSnapSaveHighlight",
  },
  opts = {
    bg_theme = "summer",
    bg_x_padding = 54,
    bg_y_padding = 40,
    code_font_family = "JetBrainsMono Nerd Font",
    mac_window_bar = true,
    save_path = "~/Pictures",
    title = "",
    watermark = "",
    watermark_font_family = "JetBrainsMono Nerd Font",
  },
}
