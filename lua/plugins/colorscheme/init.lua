-- since this is just an example spec, don't actually load anything here and return an empty spec
-- if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      opts.colorscheme = "tokyonight"
      vim.g.colorscheme = opts.colorscheme

      if opts.colorscheme == "nvchad" then
        for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
          dofile(vim.g.base46_cache .. v)
        end
      else
        -- Disable NvChad auto-reload on save
        vim.api.nvim_create_autocmd("User", {
          pattern = "VeryLazy", -- triggers once everything is loaded
          callback = function()
            pcall(vim.api.nvim_del_augroup_by_name, "ReloadNvChad")
          end,
        })
      end
    end,
  },
}
