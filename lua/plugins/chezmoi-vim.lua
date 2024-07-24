local plugin = {
  "alker0/chezmoi.vim",
  enabled = false,
  init = function()
    -- This option is required.
    vim.g["chezmoi#use_tmp_buffer"] = true
    -- add other options here if needed.
  end,
}

if vim.fn.executable "chezmoi" == 1 then
  plugin.enabled = true
end

return plugin
