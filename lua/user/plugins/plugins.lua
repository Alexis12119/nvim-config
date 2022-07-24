local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local snapshot_path = fn.stdpath "cache" .. "/snapshots"
local compile_path = fn.stdpath "config" .. "/lua/user/packer_compiled.lua"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  require("packer").packadd = "packer.nvim"
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
local group = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  command = "source <afile> | PackerSync",
  pattern = "plugins.lua",
  group = group,
})

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  compile_path = compile_path,
  snapshot_path = snapshot_path,
  git = {
    clone_timeout = 300,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use { "wbthomason/packer.nvim" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim" } -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs" } -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim" } -- Easily comment
  use { "JoosepAlviste/nvim-ts-context-commentstring" } -- Setting the commentstring option based on the cursor location in the file
  use { "kyazdani42/nvim-web-devicons" } -- icons and glyphs
  use { "kyazdani42/nvim-tree.lua" } -- File explorer
  use { "akinsho/bufferline.nvim" } -- Tabline
  use { "moll/vim-bbye" } -- Delete Buffer
  use { "nvim-lualine/lualine.nvim" } -- Statusline
  use { "akinsho/toggleterm.nvim" } -- Terminal Integration
  use { "lewis6991/impatient.nvim" } -- Improve Neovim Startup Time
  use { "lukas-reineke/indent-blankline.nvim" } -- Indent Guide
  use { "goolord/alpha-nvim" } -- Startup Screen
  use { "norcalli/nvim-colorizer.lua" } -- Preview Colors
  use { "folke/todo-comments.nvim" } -- TODO, BUG, HACK, FIXME, NOTE Highlighter

  -- Colorschemes
  use { "folke/tokyonight.nvim" }

  -- MarkDown Preview
  use {
    "iamcco/markdown-preview.nvim", -- Preview MarkDown
    run = "cd app && yarn install",
  }

  -- CodeRunner
  use { "is0n/jaq-nvim" }

  -- cmp plugins
  use { "hrsh7th/nvim-cmp" } -- The completion plugin
  use { "hrsh7th/cmp-buffer" } -- buffer completions
  use { "hrsh7th/cmp-path" } -- path completions
  use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp" } -- lsp completions
  use { "hrsh7th/cmp-nvim-lua" } -- lua completions

  -- snippets
  use { "L3MON4D3/LuaSnip" } --snippet engine
  use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use

  -- LSP
  use { "neovim/nvim-lspconfig" } -- enable LSP
  use { "williamboman/nvim-lsp-installer" } -- simple to use language server installer
  use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
  use { "RRethy/vim-illuminate" } -- LSP Higlight
  use { "simrat39/symbols-outline.nvim" } -- Symbols Outline
  use { "folke/trouble.nvim" } -- Diagnostic List
  use { "glepnir/lspsaga.nvim" } -- LSP UI

  -- Telescope
  use { "nvim-telescope/telescope.nvim" } -- FZF
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" } -- C port of fzf
  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter", -- Syntax Higlighter
    run = ":TSUpdate",
  }

  -- Git
  use { "lewis6991/gitsigns.nvim" } -- Git Signs
  use { "folke/which-key.nvim" } -- Key Bindings popup

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
