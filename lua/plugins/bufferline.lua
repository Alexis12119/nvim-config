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
        mode = "buffers",
        close_command = ":Bdelete!",
        right_mouse_command = ":Bdelete!",
        offsets = {
          { filetype = "NvimTree", text = "File Explorer", highlight = "Directory", padding = 1 },
          { filetype = "lspsagaoutline", text = "Code Outline", highlight = "Directory", padding = 1 },
        },
        indicator = {
          icon = "▎",
        },
        always_show_bufferline = false,
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 18,
        --   custom_areas = {
        --     right = function()
        --       local result = {}
        --       local version = " " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
        --       table.insert(result, { text = version })
        --       return result
        --     end,
        --   },
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
