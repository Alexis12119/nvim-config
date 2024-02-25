## Configuration Guide

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
- Edit it in the `custom/mappings.lua`.
- You can see all the available keymaps in `:NvCheatsheet` or just press `<Space> + f + k`.

| Group Name | Description                                   |
| ---------- | --------------------------------------------- |
| Find       | For searching buffers, themes, and many more. |
| Git        | Git related operations.                       |
| Debugger   | Debugging related operations.                 |
| LSP        | LSP related operations.                       |
| Options    | Toggle Options.                               |
| Plugins    | Plugins related operations.                   |
| Tests      | Tests related operations.                     |
| Terminal   | Terminal related operations.                  |
| Sessions   | Sessions related operations.                  |
| Neovim     | Neovim and Config related operations.         |
| Runner     | Code runner related operations.               |
| Venv       | Switch Virtual Environment.                   |
| Harpoon    | Mark and Manage your marks.                   |

#### 6. Add plugins

- Create a new file in `lua/custom/plugins` folder. Like this `numb.lua`.
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
- Edit them in `lua/custom/chadrc.lua`.

> statusline - the bar at the bottom of the window.

> tabufline - the bar at the top of the window.

#### 9. Override the `Nvchad` Themes?

- Read this [guide](https://nvchad.com/docs/config/theming)

#### 10. Override and Add Highlights/Colors?

- Edit them in `lua/custom/highlights.lua`.
- You can run `:Telescope highlights` to see all the available highlights.
- You can also press `<Space> + n + i` to see the `highlight group` at your cursor position.

#### 11. `lazy.nvim` vs. `mason.nvim` vs `LazyVim`

- `lazy.nvim` is the plugin manager that install, delete, update plugins.
- `LazyVim` is a neovim configuration that uses `lazy.nvim` as the plugin manager.
- `mason.nvim` is a package manager that install, delete, update packages such as `LSP`, `Formatters`, `DAP(Debug Adapter Protocol)`, and `Linters`.

#### 12. `Jdtls` debugging tip

- Run `:JdtUpdateDebugConfig` to get the debug configurations.
