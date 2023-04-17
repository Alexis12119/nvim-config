require("nightly").setup {
  color = "green", -- black, blue, green or red
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
