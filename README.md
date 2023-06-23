<div align="center">

<a href="">
      <img alt="Last commit" src="https://img.shields.io/github/last-commit/Alexis12119/nvim-config?style=for-the-badge&logo=git&color=000F10&logoColor=dark orange&labelColor=302D41"/>
    </a>
    
[![](https://img.shields.io/badge/Neovim-0.9+-blueviolet.svg?style=for-the-badge&color=000F10&logo=Neovim&logoColor=green&labelColor=302D41)](https://github.com/neovim/neovim)

![Screenshot (153)](https://github.com/Alexis12119/nvim-config/assets/74944536/69aa80d4-c8f5-422b-8600-03fcc0863ff1)
![Screenshot (155)](https://github.com/Alexis12119/nvim-config/assets/74944536/0db78674-f4df-4203-a7a7-01706fd63bc1)
![Screenshot (154)](https://github.com/Alexis12119/nvim-config/assets/74944536/b7cae6e6-1236-4d65-9196-e97279777ac8)

</div>

### ✨ Features

- Plugin Manager called [lazy.nvim](https://github.com/folke/lazy.nvim).
- Customized Everblush theme called [nightly.nvim](https://github.com/Alexis12119/nightly.nvim) and many more themes.
- Manage projects with [project.nvim](https://github.com/ahmedkhalf/project.nvim).
- Statusline with [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim).
- Tabline with [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) and [scope.nvim](https://github.com/tiagovla/scope.nvim).
- File Explorer [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua).
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
