<div align="center">

![Last commit](https://img.shields.io/github/last-commit/Alexis12119/nvim-config?style=for-the-badge&logo=git&color=000F10&logoColor=dark%20orange&labelColor=302D41)

[![](https://img.shields.io/badge/Neovim-0.10+-blueviolet.svg?style=for-the-badge&color=000F10&logo=Neovim&logoColor=green&labelColor=302D41)](https://github.com/neovim/neovim)

![Preview](https://github.com/Alexis12119/nvim-config/assets/74944536/33c4ae39-04d7-4dbb-9830-2804f87e92fa)

</div>

## 📄 Requirements

Before you dive in, ensure you have the following requirements installed:

<details>
<summary>Click to see the requirements</summary><br />

In windows, you can use [scoop](https://scoop.sh/) to install them.

- **Git:**

  - [lazygit](https://github.com/jesseduffield/lazygit)

- **Telescope:**

  - [fd](https://github.com/sharkdp/fd)
  - [bat](https://github.com/sharkdp/bat)
  - [ripgrep](https://github.com/BurntSushi/ripgrep)
  - [make](https://www.gnu.org/software/make/)
  - [mingw-nuwen](https://nuwen.net/mingw.html)

- **Nerd Font (For Icons):**

  - [JetBrainsMono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono)
  - [Other Fonts](https://www.nerdfonts.com/font-downloads)

- **Neovim:**

  - [Neovim 0.9+](https://github.com/neovim/neovim/releases)
  </details>

## 💻 Installation

Please follow these steps:

1. **Preparation**:

   - Ensure that Neovim is not running.
   - Remove or move your current `nvim` directory (if it exists).

2. **Installation**:

   - On Linux/MacOS:

     ```sh
     bash <(curl -s https://raw.githubusercontent.com/Alexis12119/nvim-config/main/installer/install.sh)
     ```

   - On Windows (Powershell):
     ```ps1
     Invoke-WebRequest https://raw.githubusercontent.com/Alexis12119/nvim-config/main/installer/install.ps1 -UseBasicParsing | Invoke-Expression
     ```

## ✨ Features

- **Plugin Management**: Efficiently manage plugins with [lazy.nvim](https://github.com/folke/lazy.nvim).
- **Compiler**: Compile your code with [compiler.nvim](https://github.com/Zeioth/compiler.nvim).
- **Debugging**: Debug issues with [nvim-dap](https://github.com/mfussenegger/nvim-dap) with [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui).
- **Tests**: Run tests with [neotest](https://github.com/nvim-neotest/neotest).
- **Project Management**: Simplify project handling with [project.nvim](https://github.com/ahmedkhalf/project.nvim).
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

I appreciate the support from all the Stargazers!

[![Stargazers](http://reporoster.com/stars/dark/notext/Alexis12119/nvim-config)](https://github.com/Alexis12119/nvim-config/stargazers)

### CREDITS

This Neovim configuration is built upon the foundation of NvChad. Special thanks to the NvChad community and developers for their fantastic work.

- [NvChad](https://github.com/NvChad/NvChad)

> “Make it work, make it right, make it fast.”

\- Kent Beck

---
