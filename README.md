<div align="center">

![Last commit](https://img.shields.io/github/last-commit/Alexis12119/nvim-config?style=for-the-badge&logo=git&color=000F10&logoColor=dark%20orange&labelColor=302D41)

[![](https://img.shields.io/badge/Neovim-0.9+-blueviolet.svg?style=for-the-badge&color=000F10&logo=Neovim&logoColor=green&labelColor=302D41)](https://github.com/neovim/neovim)

![Preview](https://github.com/Alexis12119/nvim-config/assets/74944536/df13b52b-4c4c-41b1-aee3-09ecb04f5112)

</div>

## ✨ Features

- **Plugin Management**: Efficiently manage plugins with [lazy.nvim](https://github.com/folke/lazy.nvim).
- **Built-in Code Runner**: Execute code right from Neovim.
- **Project Management**: Simplify project handling with [project.nvim](https://github.com/ahmedkhalf/project.nvim).
- **File Explorer**: Navigate projects seamlessly using [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua).
- **Diff Viewer**: Easily cycle through diffs with [diffview.nvim](https://github.com/sindrets/diffview.nvim).
- **Enhanced Searching**: Improve searching with [flash.nvim](https://github.com/folke/flash.nvim).
- **Autocompletion**: Experience intelligent autocompletion with [nvim-cmp](https://github.com/hrsh7th/nvim-cmp).
- **Language Support**: Harness the power of Language Server Protocol with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).
- **Formatting**: Keep your code clean with [conform.nvim](https://github.com/stevearc/conform.nvim).
- **Syntax Highlighting**: Enjoy enhanced syntax highlighting with [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
- **Fuzzy Finding**: Find files and more with ease using [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim).
- **Integrated Terminal**: Access a terminal within Neovim using [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim).
- **Git Integration**: Effortlessly manage Git repositories with [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) and [lazygit](https://github.com/jesseduffield/lazygit).
- **Keymap Cheatsheet**: Quickly reference keymaps with [which-key.nvim](https://github.com/folke/which-key.nvim).
- **Markdown Preview**: Preview your Markdown files with [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim).

## 🌟 Stargazers

I appreciate the support from all the Stargazers! [![Stargazers](https://reporoster.com/stars/dark/notext/Alexis12119/nvim-config)](https://github.com/Alexis12119/Nvchad-user/stargazers)

## 📄 Requirements

Before you dive in, ensure you have the following requirements installed:

- **Git:**

  - [lazygit](https://github.com/jesseduffield/lazygit)

- **Telescope:**

  - [fd](https://github.com/sharkdp/fd)
  - [bat](https://github.com/sharkdp/bat)
  - [ripgrep](https://github.com/BurntSushi/ripgrep)
  - [make](https://www.gnu.org/software/make/)

- **Nerd Font (For Icons):**

  - [JetBrainsMono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono)
  - [Other Fonts](https://www.nerdfonts.com/font-downloads)

- **Neovim:**
  - [Neovim 0.9+](https://github.com/neovim/neovim/releases)

**NOTE:** I'm using [scoop](https://scoop.sh/#/) to install them.

## 💻 Installation

To get started, follow these steps:

1. Remove or move your current `nvim` directory (if it exists) and make sure Neovim is not running.
2. Clone the configuration and NvChad:

   - Linux:

     ```sh
     git clone https://github.com/NvChad/NvChad.git ~/.config/nvim
     git clone https://github.com/Alexis12119/nvim-config.git ~/.config/nvim/lua/custom
     ```

   - Windows (Powershell):

     ```ps1
     Invoke-WebRequest https://raw.githubusercontent.com/Alexis12119/nvim-config/main/installer/install.ps1 -UseBasicParsing | Invoke-Expression
     ```

   - Windows (CMD):

     ```cmd
     git clone https://github.com/NvChad/NvChad.git %localappdata%\nvim
     git clone https://github.com/Alexis12119/nvim-config.git %localappdata%\nvim\lua\custom
     ```

3. Run `nvim` and wait for the plugins to be installed.

---

### CREDITS

This Neovim configuration is built upon the foundation of NvChad. Special thanks to the NvChad community and developers for their fantastic work.

- [NvChad](https://github.com/NvChad/NvChad)

> “Make it work, make it right, make it fast.”

\- Kent Beck

---
