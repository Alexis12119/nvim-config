local os = "language_server.sh"

if vim.fn.has "win32" == 1 then
  os = "language_server.bat"
end

return {
  cmd = { vim.fn.stdpath "data" .. "/mason/packages/elixir-ls/" .. os },
}
