---@type NvPluginSpec
return {
  "alker0/chezmoi.vim",
  cond = vim.fn.executable "chezmoi" == 1,
  lazy = false,
  init = function()
    -- This option is required.
    vim.g["chezmoi#use_tmp_buffer"] = true
    -- add other options here if needed.
  end,
}
