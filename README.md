<div align="center">

<a href="https://github.com/Alexis12119/nvim-config/blob/master/LICENSE"
        ><img
            src="https://img.shields.io/github/license/Alexis12119/nvim-config?style=flat-square&logo=GNU&label=License&color=lightblue"
            alt="License"
    />
[![Last time update this file](https://img.shields.io/github/last-commit/Alexis12119/nvim-config?label=Last%20Activity&style=flat-square&color=lightgreen "Last time update this file")](https://github.com/Alexis12119/nvim-config)
[![Neovim Minimum Version](https://img.shields.io/badge/Neovim-0.7.0-blueviolet.svg?style=flat-square&logo=Neovim&color=lightgreen&logoColor=green)](https://github.com/neovim/neovim)
[![GitHub Issues](https://img.shields.io/github/issues/Alexis12119/nvim-config.svg?style=flat-square&label=Issues&color=red)](https://github.com/Alexis12119/nvim-config/issues)
</div>

## 📄 Requirements

<details><summary><b>Click to expand</b></summary>

### Git
* [Git](https://git-scm.com/downloads)

### Powershell (Windows)
* [Powershell](https://github.com/PowerShell/PowerShell)

### Telescope
* [fd](https://github.com/sharkdp/fd)
* [bat](https://github.com/sharkdp/bat)
* [ripgrep](https://github.com/BurntSushi/ripgrep)
* [make](https://www.gnu.org/software/make/)

### Gitsigns
* [lazygit](https://github.com/jesseduffield/lazygit)

### Markdown-Preview
* [yarn](https://github.com/yarnpkg/yarn)

### Nerd Font (For Icons)

* [Hack](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack)
* [Other Fonts](https://www.nerdfonts.com/font-downloads)

## Neovim

* [Neovim 0.7+](https://github.com/neovim/neovim/releases/tag/v0.7.2)

**NOTE:** You can install them through [scoop](https://scoop.sh/#/) on windows.

</details>

## 💻 Installation

Make sure to remove or move your current `nvim` directory

* Linux

```sh
git clone https://github.com/Alexis12119/nvim-config.git ~/.config/nvim  
```

* Windows (Powershell)

```sh
git clone https://github.com/Alexis12119/nvim-config.git $env:LOCALAPPDATA\nvim
```

* Windows (Cmd) 
```sh
git clone https://github.com/Alexis12119/nvim-config.git  %userprofile%\Local\AppData\Local\nvim
```

Run `nvim` and wait for the plugins to be installed.

**NOTE:** You will notice treesitter installing and compiling bunch of parsers the next time you open Neovim


## 🏥 Health Check
```vim
:checkhealth
```
You'll probably notice you don't have support for copy/paste also that python and node haven't been setup.

First we'll fix copy/paste

* On mac pbcopy should be builtin

* On Ubuntu
```sh
sudo apt install xsel # for x11
sudo apt install wl-clipboard # for wayland
```

Next we need to install python support (node is optional).

* Python

```pip
pip install pynvim
```

* Node

```
npm i -g neovim
```

## ⌨️ Keymaps

* [Keymaps](https://github.com/Alexis12119/nvim-config/blob/master/lua/user/core/keymaps.lua) - For common mappings.
* [Lsp-Keymaps](https://github.com/Alexis12119/nvim-config/blob/master/lua/user/lsp/handlers.lua) - For some lsp mappings.
* [Which-Key-Keymaps](https://github.com/Alexis12119/nvim-config/blob/master/lua/user/plugins/whichkey.lua) - For other mappings.

## ⚡️ LSP, Formatters, And Linters

To add a new LSP

First Enter:

```
:LspInstallInfo
```

and press i on the Language Server you wish to install

**NOTE:** If the LSP/server is not included in the list. The LSP/server will not start: [server](https://github.com/Alexis12119/nvim-config/blob/master/lua/user/lsp/lsp-installer.lua)

* Default servers:

```lua
local servers = {
  "jsonls", -- Json
  "sumneko_lua", -- Lua
  "clangd", -- C/C++
  "jdtls", -- Java
  "intelephense", -- PHP
  "cssls", -- CSS
  "html", -- HTML
  "tsserver", -- Javasript and Typescript
  "emmet_ls", -- Html and CSS
  "pyright", -- Python
  "omnisharp", -- C#
  "yamlls", -- Yml
  "gopls", -- Go
  "lemminx", -- Xml
  "vimls", -- Vimscript
  "marksman", -- Markdown
  "cmake", -- Cmake
  "powershell_es", -- Powershell
  -- "julials",
  -- "cssmodules_ls",
}
```
Make sure the `formatter` or `linter` is installed and add it to this setup function: [null-ls](https://github.com/Alexis12119/nvim-config/blob/master/lua/user/lsp/null-ls.lua).

**NOTE:** Some are already setup as examples, remove them if you want

### ⚒️ Plugins

- [packer.nvim](https://github.com/wbthomason/packer.nvim)
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)
- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- [vim-bbye](https://github.com/moll/vim-bbye)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
- [impatient.nvim](https://github.com/lewis6991/impatient.nvim)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [alpha-nvim](https://github.com/goolord/alpha-nvim)
- [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- [markdown-preview](https://github.com/iamcco/markdown-preview.nvim)
- [jaq-nvim](https://github.com/is0n/jaq-nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [cmp-path](https://github.com/hrsh7th/cmp-path)
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
- [vim-illuminate](https://github.com/RRethy/vim-illuminate)
- [symbols-outline](https://github.com/simrat39/symbols-outline.nvim)
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
---


### ✨ Special Thanks 
* [LunarVim](https://github.com/LunarVim) - For some references on Lua Configuration and README.
* [NvChad](https://github.com/NvChad/NvChad) - For some references on README.


> “Make it work, make it right, make it fast.”

\- Kent Beck
