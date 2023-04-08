return {
  "akinsho/bufferline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    {
      "tiagovla/scope.nvim",
      config = function()
        require("scope").setup()
      end,
    },
  },
  config = function()
    local bufferline = require "bufferline"

    bufferline.setup {
      options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        offsets = {
          { filetype = "NvimTree", text = "File Explorer", highlight = "Directory", padding = 1 },
          { filetype = "lspsagaoutline", text = "Code Outline", highlight = "Directory", padding = 1 },
        },
        indicator = {
          icon = "▎",
        },
        always_show_bufferline = true,
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 18,
      },
      highlights = {
        buffer_selected = {
          bold = false,
          italic = false,
        },
        tab_selected = {
          bold = false,
          italic = false,
        },
      },
    }
  end,
}
