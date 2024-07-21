return {
  "razak17/tailwind-fold.nvim",
  enabled = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = {
    "TailwindFoldDisable",
    "TailwindFoldEnable",
    "TailwindFoldToggle",
  },
  ft = {
    "html",
    "svelte",
    "astro",
    "vue",
    "typescriptreact",
    "php",
    "blade",
  },
}
