return {
  {
    "zbirenbaum/copilot.lua",
    build = "<cmd>Copilot auth<CR>",
    cmd = "Copilot",
    opts = {
      panel = { enabled = false },
      suggestion = { enabled = false },
    },
    config = function(_, opts)
      require("copilot").setup(opts)
      vim.cmd "Copilot disable"
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
      "zbirenbaum/copilot.lua",
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
      vim.keymap.set("n", "<leader>aq", function()
        local input = vim.fn.input "Quick Chat: "
        if input ~= "" then
          require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
        end
      end, { desc = "CopilotChat | Quick Chat", silent = true })
      vim.keymap.set("n", "<leader>ah", function()
        local actions = require "CopilotChat.actions"
        require("CopilotChat.integrations.telescope").pick(actions.help_actions())
      end, { desc = "CopilotChat | Help Actions", silent = true })
      vim.keymap.set("n", "<leader>ap", function()
        local actions = require "CopilotChat.actions"
        require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
      end, { desc = "CopilotChat | Prompt Actions", silent = true })
    end,
    config = function(_, opts)
      local chat = require "CopilotChat"
      chat.setup(opts)
      require("CopilotChat.integrations.cmp").setup()
    end,
  },
}
