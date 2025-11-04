---@type NvPluginSpec
-- NOTE: Completion Engine

return {
  {
    import = "nvchad.blink.lazyspec",
    enabled = true,
  },
  {
    "saghen/blink.cmp",
    enabled = true,
    -- optional: provides snippets for the snippet source
    -- use a release tag to download pre-built binaries
    version = "1.*",
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',
    init = function()
      require("luasnip").filetype_extend("javascriptreact", { "html" })
      require("luasnip").filetype_extend("typescriptreact", { "html" })
      require("luasnip").filetype_extend("svelte", { "html" })
      require("luasnip").filetype_extend("vue", { "html" })
      require("luasnip").filetype_extend("php", { "html" })
      require("luasnip").filetype_extend("javascript", { "javascriptreact" })
      require("luasnip").filetype_extend("typescript", { "typescriptreact" })

      vim.keymap.set("n", "<leader>oa", function()
        vim.g.toggle_blink = not vim.g.toggle_blink
        if vim.g.toggle_blink then
          vim.notify("Toggled On", vim.log.levels.INFO, { title = "Autocomplete" })
        else
          vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Autocomplete" })
        end
      end, { desc = "Options | Toggle Autocomplete" })
    end,

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- Use this solution for now.
      enabled = function()
        return not vim.tbl_contains({ "DressingInput", "sagarename" }, vim.bo.filetype) and vim.g.toggle_blink
      end,
      completion = {
        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          },
        },
      },
      cmdline = {
        completion = {
          list = {
            selection = {
              preselect = false,
              auto_insert = true,
            },
          },

          menu = {
            auto_show = function(ctx)
              return vim.fn.getcmdtype() == ":"
              -- enable for inputs as well, with:
              -- or vim.fn.getcmdtype() == '@'
            end,
          },
        },
      },
      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { "ecolog", "lazydev", "lsp", "path", "snippets", "buffer", "avante" },
        per_filetype = {
          sql = { "snippets", "dadbod", "buffer" },
          mysql = { "snippets", "dadbod", "buffer" },
          plsql = { "snippets", "dadbod", "buffer" },
        },
        providers = {
          ecolog = { name = "ecolog", module = "ecolog.integrations.cmp.blink_cmp" },
          dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
          avante = {
            module = "blink-cmp-avante",
            name = "Avante",
            opts = {},
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        build = "make install_jsregexp",
      },
      {
        "Kaiser-Yang/blink-cmp-avante",
      },
      {
        "ph1losof/ecolog.nvim",
        opts = {
          integrations = {
            blink_cmp = true,
          },
        },
      },
    },
  },
}
