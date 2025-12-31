# 🚀 Modern Development Environment

A modern Neovim setup with AI-powered coding, extensive language support,
and IDE features.

Perfect for developers seeking a single, unified environment for web development,
backend systems, mobile apps, and competitive programming.

- [🚀 Installation](#installation)
- [✨ Features](#features)
- [⚙️ Configuration](#configuration)
- [📁 Structure](#structure)
- [🛠️ Customization Guide](#customization-guide)
- [🔍 Troubleshooting](#troubleshooting)
- [🤝 Contributing](#contributing)
- [📄 License](#license)
- [🙏 Credits](#credits)
- [🔗 Links](#links)

## Installation

### Prerequisites

In windows, you can use [scoop](https://scoop.sh/) to install them.

- **Docker:**
  - [lazydocker](https://github.com/jesseduffield/lazydocker)

- **Git:**
  - [lazygit](https://github.com/jesseduffield/lazygit)

- **Telescope:**
  - [fd](https://github.com/sharkdp/fd)
  - [bat](https://github.com/sharkdp/bat)
  - [ripgrep](https://github.com/BurntSushi/ripgrep)
  - [make](https://www.gnu.org/software/make/)
  - [mingw-nuwen](https://nuwen.net/mingw.html)

- **Mason.nvim:**
  - [nodejs](https://nodejs.org/en)

- **Tree-sitter:**
  - [tree-sitter-cli](https://www.npmjs.com/package/tree-sitter-cli)

- **Nerd Font (For Icons):**
  - [JetBrainsMono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono)
  - [Other Fonts](https://www.nerdfonts.com/font-downloads)

### Quick Install (Recommended)

#### Linux/macOS

```bash
bash <(curl -s https://raw.githubusercontent.com/Alexis12119/nvim-config/main/installer/install.sh)
```

#### Windows (PowerShell)

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

Invoke-WebRequest https://raw.githubusercontent.com/Alexis12119/nvim-config/main/installer/install.ps1 -UseBasicParsing |
Invoke-Expression
```

### Manual Install

1. Backup your current Neovim configuration:

   ```bash
   # Linux/macOS
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup

   # Windows
   mv $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.backup
   mv $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.backup
   ```

2. Clone this configuration:

   ```bash
   # Linux/macOS
   git clone https://github.com/Alexis12119/nvim-config.git ~/.config/nvim

   # Windows
   git clone https://github.com/Alexis12119/nvim-config.git $env:LOCALAPPDATA\nvim
   ```

3. Start Neovim and let Lazy install the plugins:

   ```bash
   nvim
   ```

## Features

### Neovim
- **Hardtime** - Breaks your vim bad habits
- **Precognition** - Assits you in your vim journey

### 🤖 AI & Coding

- **Supermaven** - AI-powered code completion
- **LuaSnip** - Snippet engine
- **Mini Comment/Surround** - Quick commenting and surrounding
- **Yanky** - Enhanced yank/paste functionality
- **Refactoring** - Code refactoring tools

### 🔧 Development Tools

- **Compiler.nvim** - Code compilation and running with task management
- **Debug Adapter Protocol** - Integrated debugging
- **Telescope** - Fuzzy finder and picker
- **Aerial** - Code outline/symbols
- **Inc-rename** - Incremental renaming
- **Dial** - Enhanced increment/decrement

### 🎨 UI & Experience

- **Custom GitHub Dark Dimmed** theme with extensive language-specific highlighting
- **Indent Blankline** - Visual indentation guides
- **Treesitter Context** - Context-aware code display
- **Noice** - Modern UI for commands and notifications
- **Which-key** - Keybinding helper
- **Snacks.nvim** - Modern UI components and utilities

### 🌐 Language Support

#### Web Development

- **TypeScript/JavaScript** - Full TS/JS support with Volar/VTSLS
- **Vue** - Vue.js framework
- **Svelte** - Svelte framework
- **Astro** - Astro framework
- **Tailwind CSS** - Utility-first CSS
- **HTML/CSS/JSON/YAML** - Web standards

#### Backend & Systems

- **Python** - Python development with venv-selector
- **Go** - Go language support
- **Rust** - Rust programming with rustaceanvim
- **Java** - Java development with nvim-java and Spring Boot support
- **C/C++** - C/C++ with Clangd
- **C#/.NET** - .NET development with [easy-dotnet.nvim](https://github.com/GustavEikaas/easy-dotnet.nvim)
- **Kotlin** - Kotlin language
- **Ruby** - Ruby development
- **PHP** - PHP development with Laravel framework support
- **Zig** - Zig language

#### Data & DevOps

- **SQL** - Database queries with vim-dadbod suite
- **Docker** - Container support
- **Git** - Version control with Diffview integration
- **Prisma** - Database ORM
- **CMake** - Build system
- **Toml** - Configuration files

#### Documentation & Markup

- **Markdown** - Documentation with preview
- **Typst** - Modern typesetting

### 🛠️ Tooling

- **Prettier** - Code formatting
- **ESLint** - JavaScript linting
- **Neoconf** - Project configuration
- **Project.nvim** - Project management with custom patterns
- **Rest** - HTTP client with kulala.nvim
- **Dot** - Graphviz support
- **Neotest** - Testing framework with multi-language adapters

### 🚀 Unique Features

- **Real-time Collaboration** - Nomad for pair programming
- **Database Integration** - vim-dadbod for database management
- **Framework Support** - Laravel, Spring Boot, Flutter-tools
- **Competitive Programming** - cphelper.nvim
- **Performance Optimizations** - Custom Neovim options for better responsiveness

## Configuration

### Managing Language Support

This configuration includes extensive language support through LazyVim Extras.
If you're seeing too many notifications about missing language servers or tools,
you can easily remove unwanted language integrations:

#### Using LazyExtras UI

1. Open LazyExtras: `:LazyExtras` or press `<leader>le`
2. Navigate to the language/category you want to remove
3. Press `x` to toggle the extra off (it will be marked with `✗`)
4. Restart Neovim to apply changes

#### Direct Configuration

Edit `lazyvim.json` in your config root and remove unwanted extras from the list.

#### Common Extras to Consider Removing

- **Web Development**: TypeScript, Vue, Svelte, Astro, Tailwind CSS
- **Backend Languages**: Java, C#, PHP, Rust, Go, Kotlin, Ruby, Zig
- **Database Tools**: SQL, Prisma, vim-dadbod suite
- **Framework Support**: Laravel, Spring Boot, Flutter-tools

### Theme

- **Theme**: Custom GitHub Dark Dimmed with extensive language-specific highlighting
- **Telescope Style**: Borderless
- **Custom Highlights**: Detailed syntax highlighting for Python, Java,
  JavaScript/TypeScript, Go, Rust, PHP, Dart, C#, and more

#### Changing Colorscheme

To change the colorscheme, edit `lua/config/globals.lua` and modify the `vim.g.colorscheme` value:

Available themes:

- `tokyonight` - Default modern dark theme
- `nvchad` - Base46 NvChad themes

Example:

```lua
vim.g.colorscheme = "tokyonight"  -- Switch theme
```

### Key Customizations

- **Performance Optimizations**: Faster completion (100ms updatetime),
  optimized UI settings
- **Custom LSP Settings**: Tailored configurations for each language
- **AI Integration**: Supermaven for intelligent code completion
- **Project Management**: Custom patterns for project detection
- **Database Tools**: Integrated vim-dadbod suite for database management

### Disabled Features

The following plugins are intentionally disabled to avoid conflicts:

- **nvim-tree** - File explorer (disabled)
- **oil.nvim** - Buffer explorer (disabled)
- **opencode** - AI assistant (disabled, Supermaven used instead)

## Structure

```text
~/.config/nvim/
├── installer/          # Installation scripts
│   ├── install.ps1     # PowerShell installer
│   ├── install.sh      # Shell installer
│   └── install_requirements.ps1
├── lua/
│   ├── config/         # Core configuration (options, keymaps, autocmds)
│   │   ├── statusline/ # Custom statusline configuration
│   │   └── tabufline/  # Tabline configuration
│   ├── plugins/        # Plugin configurations
│   │   ├── ai/         # AI-related plugins
│   │   ├── collaboration/ # Real-time collaboration
│   │   ├── colorscheme/ # Theme configuration
│   │   ├── dap/       # Debug Adapter Protocol (DAP) configurations
│   │   ├── editor/     # Core editor plugins
│   │   ├── fun/        # Fun and experimental plugins
│   │   ├── integration/ # Integration plugins
│   │   ├── langs/      # Language-specific tools
│   │   ├── lsp/        # LSP configurations and settings
│   │   │   └── settings/ # Language-specific LSP settings
│   │   ├── ui/         # User interface plugins
│   │   └── util/       # Utility plugins
│   ├── themes/         # Custom themes (GitHub Dark Dimmed)
│   ├── chadrc.lua      # NvChad configuration
│   └── highlights.lua  # Custom syntax highlighting
├── snippets/           # Code snippets
│   ├── snipmate/       # Snipmate format snippets
│   └── vscode/         # VSCode format snippets
├── README.md
├── init.lua           # Entry point
├── lazyvim.json       # LazyVim extras configuration
├── .luarc.json        # Lua language server config
├── ginit.vim          # GUI Neovim configuration
├── stylua.toml        # StyLua formatter configuration
└── LICENSE            # License file
```

### Custom Additions

- **Compiler.nvim** - Code compilation and task management
- **Nomad** - Real-time collaboration for pair programming
- **Database Tools** - vim-dadbod suite for database management
- **Framework Support** - Laravel, Spring Boot, Flutter-tools, .NET Framework
- **Competitive Programming** - cphelper.nvim
- **Custom Theme** - Extensive GitHub Dark Dimmed customization

### Enhanced Features

- **Project Management** - Custom project detection patterns
- **Python Development** - venv-selector integration
- **Testing** - Multi-language neotest adapters
- **Performance** - Optimized Neovim options for better responsiveness

### Intentionally Disabled

- nvim-tree and oil.nvim (file explorers)
- opencode plugins (using Supermaven instead)

## Customization Guide

### Adding New Plugins

1. Create a new file in `lua/plugins/` directory
2. Follow the `LazySpec` format used in existing plugin files
3. Use the import system in `lua/plugins/init.lua`

### Modifying Theme

- Edit `lua/themes/github_dark_dimmed.lua` for theme colors
- Modify `lua/highlights.lua` for additional syntax highlighting
- Language-specific highlights are defined in the theme file

### LSP Customization

- Language-specific LSP settings are in `lua/plugins/lsp/settings/`
- Create new files for additional language servers

## Troubleshooting

### Common Issues

- **Plugin not loading**: Check if plugin is enabled in configuration
- **LSP not starting**: Verify language server is installed and configured
- **Theme issues**: Ensure terminal supports true colors (24-bit)
- **Performance**: Check for heavy plugins or large files

### Getting Help

- Check [LazyVim](https://lazyvim.github.io/) documentation for base functionality
- Review plugin-specific documentation in their repositories
- Open an issue on this repository for configuration-specific problems

## Contributing

Feel free to submit issues and enhancement requests!

1. Fork repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the Apache License 2.0 -
see the [LICENSE](LICENSE) file for details.

## Credits

- [LazyVim](https://github.com/LazyVim/LazyVim) - The base configuration
- [NvChad](https://github.com/NvChad/NvChad) - UI components and inspiration
- All the plugin authors and contributors

## Links

- **LazyVim Docs**: [https://lazyvim.github.io/](https://lazyvim.github.io/)
- **Neovim**: [https://neovim.io/](https://neovim.io/)
