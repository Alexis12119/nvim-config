return {
  ui = {
    -- Whether to automatically check for new versions when opening the :Mason window.
    check_outdated_packages_on_open = false,
    icons = {
      package_pending = " ",
      package_installed = " ",
      package_uninstalled = " ",
    },
  },
  ensure_installed = {
    -- Lua
    "lua-language-server",
    "vim-language-server",
    "stylua",

    -- Web Development
    "prettier",
    -- "css-lsp",
    -- "html-lsp",
    -- "typescript-language-server",
    -- "deno",
    -- "svelte-language-server",
    -- "vue-language-server",
    -- "tailwindcss-language-server",
    -- "emmet-language-server",

    -- PHP
    -- "intelephense",

    -- C/C++
    "clangd",
    "clang-format",

    -- Java
    -- "jdtls",

    -- Yaml
    -- "yaml-language-server",

    -- Python
    "pyright",
    -- "autopep8",
    -- "black",
    -- "flake8"

    -- Go
    -- "gopls",
    -- "gofumpt",

    -- C#
    -- "omnisharp",
    -- "omnisharp-mono",
  },
}
