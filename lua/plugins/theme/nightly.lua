-- Set color style by time
-- local color_by_time = function()
--   local time = tonumber(os.date "%H")
--   if time >= 6 and time <= 17 then
--     return "green"
--   elseif time >= 18 and time <= 23 then
--     return "blue"
--   elseif time >= 0 and time <= 5 then
--     return "black"
--   end
-- end

require("nightly").setup {
  color = "black", -- black, blue, green or red
  transparent = false,
  styles = {
    comments = { italic = true },
    functions = { italic = false },
    keywords = { italic = false },
    variables = { italic = false },
  },
  highlights = {
    -- add or override highlights
    -- Normal = { bg = "#000000" }
  },
}
