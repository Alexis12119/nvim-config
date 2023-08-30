<div align="center">

<a href="">
      <img alt="Last commit" src="https://img.shields.io/github/last-commit/Alexis12119/nvim-config?style=for-the-badge&logo=git&color=000F10&logoColor=dark orange&labelColor=302D41"/>
    </a>
    
[![](https://img.shields.io/badge/Neovim-0.9+-blueviolet.svg?style=for-the-badge&color=000F10&logo=Neovim&logoColor=green&labelColor=302D41)](https://github.com/neovim/neovim)

![Screenshot (188)](https://github.com/Alexis12119/nvim-config/assets/74944536/a716a429-1fba-412d-b544-235b14af8528)

</div>

### ✨ Features

- Plugin Manager called [lazy.nvim](https://github.com/folke/lazy.nvim).
- Built-in Code runner.
- Peek lines with [numb.nvim](https://github.com/nacro90/numb.nvim).
- Manage projects with [project.nvim](https://github.com/ahmedkhalf/project.nvim).
- Statusline with [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim).
- Tabline with [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) and [scope.nvim](https://github.com/tiagovla/scope.nvim).
- File Explorer [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua).
- Cycling through diffs for all modified files with [diffview.nvim](https://github.com/sindrets/diffview.nvim)
- Improve searching with [flash.nvim](https://github.com/folke/flash.nvim).
- Autocompletion with [nvim-cmp](https://github.com/hrsh7th/nvim-cmp).
- Language Server Protocol with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).
- Formatting and Linting with [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim).
- Syntax highlighting with [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
- Fuzzy finding with [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim).
- Terminal with [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim).
- Git integration with [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) and [lazygit](https://github.com/jesseduffield/lazygit).
- Popup Cheatsheet for keymaps with [which-key.nvim](https://github.com/folke/which-key.nvim).
- Markdown Preview with [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim).

## 🌟 Stargazers

**Thanks for the stars**

[![Stargazers repo roster for @Alexis12119/nvim-config](https://reporoster.com/stars/dark/notext/Alexis12119/nvim-config)](https://github.com/Alexis12119/nvim-config/stargazers)

### 📄 Requirements

<details><summary>Click to view</summary>

#### Git

- [lazygit](https://github.com/jesseduffield/lazygit)

#### Telescope

- [fd](https://github.com/sharkdp/fd)
- [bat](https://github.com/sharkdp/bat)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [make](https://www.gnu.org/software/make/)

#### Nerd Font (For Icons)

- [JetBrainsMono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono)
- [Other Fonts](https://www.nerdfonts.com/font-downloads)

#### Neovim

- [Neovim 0.9+](https://github.com/neovim/neovim/releases)

**NOTE:** I'm using [scoop](https://scoop.sh/#/) to install them.

</details>

### 💻 Installation

Make sure to remove or move the current `nvim` directory and neovim isn't open.

- Linux

```sh
git clone https://github.com/Alexis12119/nvim-config.git ~/.config/nvim
```

- Windows (Powershell)

```ps1
Invoke-WebRequest https://raw.githubusercontent.com/Alexis12119/nvim-config/master/installer/install.ps1 -UseBasicParsing | Invoke-Expression
```

- Windows (CMD)

```cmd
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

Make sure the `formatter` or `linter` is installed and add it to this setup function: [null-ls](https://github.com/Alexis12119/nvim-config/blob/main/lua/plugins/null-ls.lua).

---

### CREDITS

This two repository helps me to create my own neovim lua configuration.

- [Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch)

- [nvim-lua-guide](https://github.com/nanotee/nvim-lua-guide) (It's now archived so use `:h lua-guide` instead.)

> “Make it work, make it right, make it fast.”

\- Kent Beck
