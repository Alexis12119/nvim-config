## Configuration Guide

> Quick Tip: Press `<Space> + fT` inside the `nvim` directory to show my notes in this configuration .

![guide](https://github.com/Alexis12119/nvim-config/assets/74944536/0fe305e0-a52d-49d5-9f20-6a855cb610a3)

#### 1. Icons not showing?

- Install a [Nerd Font](https://www.nerdfonts.com/font-downloads) and set it in your terminal.

#### 2. Don't know anything about `Lua`

- Read `:h lua-guide` or this [guide](https://nvchad.com/docs/quickstart/learn-lua) created by `NvChad`.
- You'll learn there how to create `Autocommands`, `User Commands`, `Mappings`, `Options`, and many more using lua.

#### 3. Install the `LSP(Language Server Protocol)` or `Intellisense(VSCode)`

- Run the command `:Mason`. You can install them by pressing `i` at the same line of the `LSP`.
- You can also directly install them by `:MasonInstall <package_name>`.

> Read `:h mason-commands` for more info.

> You can also install `Formatters`, `Linters`, and `DAP(Debug Adapter Protocol)` through `:Mason`.

#### 4. Want to learn Vim motions?

- Run the command `:Tutor`.
- Here's a [cheatsheet](https://vim.rtorr.com/) for you.

#### 5. Keybindings, keymaps or mappings.

- Read on how to create one [here](https://nvchad.com/docs/config/mappings) for `NvChad`.
- Edit it in the `lua/mappings.lua`.
- You can see all the available keymaps in `:NvCheatsheet` or just press `<Space> + f + k`.

#### 6. Add plugins

- Create a new file in `lua/plugins` folder. Like this `numb.lua`.
- Inside that file is put the plugin you want to add.
  Example:

```lua
-- Peek At Lines
return {
  "nacro90/numb.nvim",
  -- enabled = false, -- to disable the plugin
  event = "CmdlineEnter", -- event that specify when the plugin is gonna be loaded
  config = true,
  -- opts = {}
  -- many more
}
```

- Run `:w` and `:Lazy install` to install the plugin.

> Read [lazy.nvim](https://github.com/folke/lazy.nvim?tab=readme-ov-file#-plugin-spec) for more options that you can use.

> Read [this](https://github.com/folke/lazy.nvim?tab=readme-ov-file#-migration-guide). If you've used `packer.nvim` before.

#### 7. Tree-sitter(Syntax Highlighting)

- You can find here the [supported](https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages) languages.
- You can install the `language parser` through `:TSInstall <language_name>`.
- Most of the `Tree-sitter` problems can be solved by running `:TSUpdate` or reinstalling the parser by `:TSInstall`.

#### 8. Want to know how to override the `statusline` and `tabufline`?

- Read this [guide](https://nvchad.com/docs/config/nvchad_ui).
- Edit them in `lua/chadrc.lua`.

> statusline - the bar at the bottom of the window.

> tabufline - the bar at the top of the window.

#### 9. Override the `Nvchad` Themes?

- Read this [guide](https://nvchad.com/docs/config/theming)

#### 10. Override and Add Highlights/Colors?

- Edit them in `lua/highlights.lua`.
- You can run `:Telescope highlights` to see all the available highlights.
- You can also press `<Space> + n + i` to see the `highlight group` at your cursor position.

#### 11. `lazy.nvim` vs. `mason.nvim` vs `LazyVim`

- `lazy.nvim` is the plugin manager that install, delete, update plugins.
- `LazyVim` is a neovim configuration that uses `lazy.nvim` as the plugin manager.
- `mason.nvim` is a package manager that install, delete, update packages such as `LSP`, `Formatters`, `DAP(Debug Adapter Protocol)`, and `Linters`.

#### 12. `Jdtls` debugging tip

- Run `:JdtUpdateDebugConfig` to get the debug configurations.

#### 13. `Rust` debugging tip

- Run `:RustLsp debuggables` and pick the one you like in the options.

#### 14. `UV_DLOPEN ERROR` not a valid win32 application

This is a window specific problem. The problem is that the version of `gcc` is outdated.

To solve this:

- Just make sure to use the updated compiler like this [one](https://nuwen.net/mingw.html).
- Run `:TSUninstall all` to remove all the language parsers.
- Install the parser again for the language you want to use.

#### 15. Discord Rich Presence

- Run `:DiscordRichPresence` to enable or disable the Rich Presence.
- Install `arrpc` to get the rich presence in the Browser.
