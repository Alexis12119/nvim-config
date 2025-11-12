vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"

require("config.lazy")
require("config.env")
require("config.commands")
require("config.filetypes")
require("config.utils")
