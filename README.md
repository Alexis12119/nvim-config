<div align="center">

<a href="">
      <img alt="Last commit" src="https://img.shields.io/github/last-commit/Alexis12119/nvim-config?style=for-the-badge&logo=git&color=000F10&logoColor=dark orange&labelColor=302D41"/>
    </a>
    
[![](https://img.shields.io/badge/Neovim-0.8+-blueviolet.svg?style=for-the-badge&color=000F10&logo=Neovim&logoColor=green&labelColor=302D41)](https://github.com/neovim/neovim)

#### Dark
![Dark](https://user-images.githubusercontent.com/74944536/223243715-c8774d56-1bd2-4512-8e28-f50ebc53c352.png)

#### Light
![Light](https://user-images.githubusercontent.com/74944536/223243660-b96f33f9-c229-4406-8d8f-a6dfae172dd7.png)

#### Distraction Free Mode

![Distraction Free](https://user-images.githubusercontent.com/74944536/223402221-5ecaabc5-a273-402e-a375-f9aa4279c48c.png)

</div>

## 🌟 Stargazers

**Thanks for the stars**

[![](https://reporoster.com/stars/dark/notext/Alexis12119/nvim-config)](https://github.com/Alexis12119/nvim-config/stargazers)

### 🔔 Reminder

- Please, run `:h config-reminder` for special reminders and tips.
- I won't delete the `master` branch, but I will use this branch from now on.

### 📄 Requirements

<details><summary>Click to view</summary>

#### Git (Optional)

- [lazygit](https://github.com/jesseduffield/lazygit)

#### Telescope

- [fd](https://github.com/sharkdp/fd)
- [bat](https://github.com/sharkdp/bat)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [make](https://www.gnu.org/software/make/)

#### Nerd Font (For Icons)

- [JetBrainsMono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono)
- [Hack](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack)
- [Other Fonts](https://www.nerdfonts.com/font-downloads)

#### Neovim

- [Neovim 0.8+](https://github.com/neovim/neovim/releases)

**NOTE:** I'm using [scoop](https://scoop.sh/#/) to install them.

</details>

### 💻 Installation

Make sure to remove or move the current `nvim` directory and neovim isn't open.

- Linux

```sh
git clone https://github.com/Alexis12119/nvim-config.git ~/.config/nvim
```

- Windows (Powershell)

```sh
Invoke-WebRequest https://raw.githubusercontent.com/Alexis12119/nvim-config/master/installer/install.ps1 -UseBasicParsing | Invoke-Expression
```

- Windows (CMD)

```sh
git clone https://github.com/Alexis12119/nvim-config.git %localappdata%\nvim
```

Run `nvim` and wait for the plugins to be installed.

---

### 📖 Instructions

- Install LSP, Formatters, Linters

```
:MasonInstall <name>
```

- Install Language Parser

```
:TSInstall <filetype>
```

Make sure the `formatter` or `linter` is installed and add it to this setup function: [null-ls](https://github.com/Alexis12119/nvim-config/blob/master/lua/user/plugins/lsp/null-ls.lua).

---

### Plugins

| Plugin name                                                                                     | Description                                                          |
| ----------------------------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| [lazy.nvim](https://github.com/folke/lazy.nvim)                                                 | Plugin Manager                                                       |
| [neodev.nvim](https://github.com/folke/neodev.nvim)                                             | Help for Plugin Development                                          |
| [nightly.nvim](https://github.com/Alexis12119/nightly.nvim)                                     | Default Colorscheme                                                  |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)                                     | Colorscheme                                                          |
| [moonbow.nvim](https://github.com/arturgoms/moonbow.nvim)                                       | Colorscheme                                                          |
| [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim)                                       | Colorscheme                                                          |
| [catppuccin](https://github.com/catppuccin/nvim)                                                | Colorscheme                                                          |
| [vscode.nvim](https://github.com/Mofiqul/vscode.nvim)                                           | Colorscheme                                                          |
| [onedark.nvim](https://github.com/navarasu/onedark.nvim)                                        | Colorscheme                                                          |
| [onenord.nvim](https://github.com/rmehri01/onenord.nvim)                                        | Colorscheme                                                          |
| [monokai.nvim](https://github.com/tanvirtin/monokai.nvim)                                       | Colorscheme                                                          |
| [dracula.nvim](https://github.com/Mofiqul/dracula.nvim)                                         | Colorscheme                                                          |
| [palenightfall.nvim](https://github.com/JoosepAlviste/palenightfall.nvim)                       | Colorscheme                                                          |
| [vim-nightfly-colors](https://github.com/bluz71/vim-nightfly-colors)                            | Colorscheme                                                          |
| [material.nvim](https://github.com/marko-cerovac/material.nvim)                                 | Colorscheme                                                          |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap)                                            | Debug Adapter Protocol                                               |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)                                          | UI for nvim-dap                                                      |
| [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls)                                        | Extensions for the built-in LSP support in Neovim for eclipse.jdt.ls |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)                                        | Lua Functions                                                        |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs)                                      | Auto Pairs                                                           |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim)                                        | Commenting                                                           |
| [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) | Smart Commenting                                                     |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)                             | Icons                                                                |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)                                     | File Explorer                                                        |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)                                   | Tabline                                                              |
| [vim-bbye](https://github.com/moll/vim-bbye)                                                    | Delete Buffer                                                        |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)                                    | Statusline                                                           |
| [alpha-nvim](https://github.com/goolord/alpha-nvim)                                             | Start Screen                                                         |
| [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)                            | Preview Colors                                                       |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)                                   | Terminal                                                             |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)                 | Indent Guide                                                         |
| [jaq-nvim](https://github.com/is0n/jaq-nvim)                                                    | Code Runner                                                          |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                                                 | Completion Engine                                                    |
| [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)                                             | Buffer Completions                                                   |
| [cmp-path](https://github.com/hrsh7th/cmp-path)                                                 | Path Completions                                                     |
| [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)                                      | Snippet Completions                                                  |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)                                         | LSP Completions                                                      |
| [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)                                         | Lua Completions                                                      |
| [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)                                           | CommandLine Completions                                              |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip)                                                  | Snippet Engine                                                       |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)                            | Bunch of Snippets                                                    |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                                      | Built-in LSP                                                         |
| [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)                              | Formatters and Linters                                               |
| [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim)                                         | LSP UI                                                               |
| [mason.nvim](https://github.com/williamboman/mason.nvim)                                        | Package Manager                                                      |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)                    | Extension of mason.nvim                                              |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)                              | Fuzzy Finder                                                         |
| [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)        | FZF sorter for telescope written in c                                |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)                                     | Git Integration                                                      |
| [which-key.nvim](https://github.com/folke/which-key.nvim)                                       | Keymaps Popup                                                        |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)                           | Syntax Highlighting                                                  |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)                        | Markdown Previewer                                                   |
| [vim-startuptime](https://github.com/dstein64/vim-startuptime)                                  | Measure StartupTime                                                  |
| [nvim-notify](https://github.com/rcarriga/nvim-notify)                                          | A fancy, configurable, notification manager for NeoVim               |
| [dressing.nvim](https://github.com/stevearc/dressing.nvim)                                      | improve the default vim.ui interfaces                                |

### CREDITS

This two repository helps me to create my own neovim lua configuration.

- [Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch)

- [nvim-lua-guide](https://github.com/nanotee/nvim-lua-guide) (It's now archived so use `:h lua-guide` instead.)

> “Make it work, make it right, make it fast.”

\- Kent Beck
