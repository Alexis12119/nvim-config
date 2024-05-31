return {
  -- {
  --   "zbirenbaum/copilot.lua",
  --   build = ":Copilot auth",
  --   cmd = "Copilot",
  --   opts = {
  --     panel = { enabled = false },
  --     suggestion = { enabled = false },
  --   },
  --   config = function(_, opts)
  --     require("copilot").setup(opts)
  --     vim.cmd "Copilot disable"
  --   end,
  -- },
  {
    "github/copilot.vim",
    cmd = "Copilot",
    build = ":Copilot setup",
    init = function()
      vim.keymap.set("n", "<leader>ad", "<cmd>Copilot disable<cr>", { desc = "Copilot | Disable", silent = true })
      vim.keymap.set("n", "<leader>ae", "<cmd>Copilot enable<cr>", { desc = "Copilot | Enable", silent = true })
      vim.keymap.set("n", "<leader>aP", "<cmd>Copilot panel<cr>", { desc = "Copilot | Panel", silent = true })
      vim.keymap.set("i", "<C-Right>", "<Plug>(copilot-accept-word)", { desc = "Copilot | Accept Word", silent = true })
      vim.keymap.set(
        "i",
        "<M-C-Right>",
        "<Plug>(copilot-accept-line)",
        { desc = "Copilot | Accept Line", silent = true }
      )
      vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)", { desc = "Copilot | Show Next Suggestion", silent = true })
      vim.keymap.set(
        "i",
        "<M-[>",
        "<Plug>(copilot-previous)",
        { desc = "Copilot | Show Previous Suggestion", silent = true }
      )
      vim.g.copilot_filetypes = { ["copilot-chat"] = false }
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cmd = {
      "CopilotChat",
      "CopilotChatOpen",
      "CopilotChatClose",
      "CopilotChatToggle",
      "CopilotChatStop",
      "CopilotChatReset",
      "CopilotChatSave",
      "CopilotChatLoad",
      "CopilotChatDebugInfo",
      "CopilotChatExplain",
      "CopilotChatReview",
      "CopilotChatFix",
      "CopilotChatOptimize",
      "CopilotChatDocs",
      "CopilotChatTests",
      "CopilotChatFixDiagnostic",
      "CopilotChatCommit",
      "CopilotChatCommitStaged",
    },
    dependencies = {
      -- "zbirenbaum/copilot.lua",
      "github/copilot.vim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp",
    },
    opts = {
      allow_insecure = true,
      -- Disable default <tab> completion
      mappings = {
        complete = {
          insert = "",
        },
      },
      -- window = {
      --   layout = "float",
      --   relative = "cursor",
      --   width = 1,
      --   height = 0.4,
      --   row = 1,
      -- },
    },
    init = function()
      vim.keymap.set({ "n", "v" }, "<leader>aq", function()
        local input = vim.fn.input "Quick Chat: "
        if input ~= "" then
          require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
        end
      end, { desc = "CopilotChat | Quick Chat", silent = true })
      vim.keymap.set({ "n", "v" }, "<leader>ah", function()
        local actions = require "CopilotChat.actions"
        require("CopilotChat.integrations.telescope").pick(actions.help_actions())
      end, { desc = "CopilotChat | Help Actions", silent = true })
      vim.keymap.set({ "n", "v" }, "<leader>ap", function()
        local actions = require "CopilotChat.actions"
        require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
      end, { desc = "CopilotChat | Prompt Actions", silent = true })
      vim.keymap.set(
        { "n", "v" },
        "<leader>ac",
        "<cmd>CopilotChatToggle<cr>",
        { desc = "CopilotChat | Toggle Chat", silent = true }
      )
    end,
    config = function(_, opts)
      local chat = require "CopilotChat"
      chat.setup(opts)
      require("CopilotChat.integrations.cmp").setup()
    end,
  },
}
