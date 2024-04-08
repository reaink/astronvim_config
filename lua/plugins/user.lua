---@type LazySpec
return {
  {
    "andrewferrier/debugprint.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      {
        "gdp",
        function() return require("debugprint").debugprint { variable = true } end,
        desc = "Print debug info",
        expr = true,
      },
      {
        "gdp",
        function() return require("debugprint").debugprint { variable = true } end,
        desc = "Print selection debug info",
        mode = "v",
        expr = true,
      },
    },
    config = function()
      require("debugprint").setup {
        create_keymaps = false,
      }
    end,
    version = "*",
  },
  {
    "smjonas/live-command.nvim",
    cmd = { "Norm" },
    config = function()
      require("live-command").setup {
        commands = {
          Norm = { cmd = "norm" },
        },
      }
    end,
  },
  {
    "jxnblk/vim-mdx-js",
  },

  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile" },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
      { "<leader>lgc", "<cmd>LazyGitConfig<cr>", desc = "LazyGitConfig" },
      { "<leader>lgf", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "LazyGitFilterCurrentFile" },
    },
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    cmd = { "ChatGPT", "ChatGPTRun", "ChatGPTActAs", "ChatGPTCompleteCode", "ChatGPTEditWithInstructions" },
    keys = {
      { "<leader>a", desc = "ChatGPT" },
      { "<leader>aa", "<cmd>ChatGPT<cr>", desc = "Chat" },
      { "<leader>ac", "<cmd>ChatGPTRun complete_code<cr>", desc = "Complete Code", mode = { "n", "v" } },
      { "<leader>ae", "<cmd>ChatGPTEditWithInstructions<cr>", desc = "Edit with Instructions", mode = { "n", "v" } },
      { "<leader>ag", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction", mode = { "n", "v" } },
      { "<leader>at", "<cmd>ChatGPTRun translate<CR>", desc = "Translate", mode = { "n", "v" } },
      { "<leader>ak", "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords", mode = { "n", "v" } },
      { "<leader>ad", "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring", mode = { "n", "v" } },
      { "<leader>ats", "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests", mode = { "n", "v" } },
      { "<leader>ao", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code", mode = { "n", "v" } },
      { "<leader>as", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize", mode = { "n", "v" } },
      { "<leader>af", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs", mode = { "n", "v" } },
      { "<leader>ax", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code", mode = { "n", "v" } },
      { "<leader>ar", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit", mode = { "n", "v" } },
      {
        "<leader>cl",
        "<cmd>ChatGPTRun code_readability_analysis<CR>",
        desc = "Code Readability Analysis",
        mode = { "n", "v" },
      },
    },
    config = function()
      local config = {
        api_host_cmd = os.getenv "OPENAI_API_HOST",
        api_key_cmd = os.getenv "OPENAI_API_KEY",
        openai_params = {
          model = "gpt-4o",
          frequency_penalty = 0,
          presence_penalty = 0,
          max_tokens = 1000,
          temperature = 0,
          top_p = 1,
          n = 1,
        },
        openai_edit_params = {
          model = "gpt-4o",
          frequency_penalty = 0,
          presence_penalty = 0,
          temperature = 0,
          top_p = 1,
          n = 1,
        },
      }
      local chatgpt = require "chatgpt"
      chatgpt.setup(config)
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "petertriho/nvim-scrollbar",
    opts = {
      handlers = {
        cursor = false,
      },
    },
  },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    cmd = "Neogen",
    keys = {
      { "gdd", function() require("neogen").generate {} end, desc = "Neogen" },
    },
    config = true,
  },
  {
    "xlboy/swap-ternary.nvim",
    opts = {},
    config = function() end,
  },
  {
    "chrisgrieser/nvim-early-retirement",
    config = true,
    event = "VeryLazy",
  },
  {
    "gsuuon/tshjkl.nvim",
    opts = {
      keymaps = {
        toggle = "<S>gv",
      },
    },
  },
  { "akinsho/git-conflict.nvim", version = "*", config = true },
  {
    "xlboy/node-edge-toggler.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      { "%", function() require("node-edge-toggler").toggle() end, desc = "Node start/end toggle" },
    },
  },
  {
    "soulis-1256/eagle.nvim",
    opts = {},
  },
  {
    "mcauley-penney/visual-whitespace.nvim",
    config = true,
  },
  {
    "rasulomaroff/reactive.nvim",
    opts = {
      builtin = {
        cursorline = true,
        cursor = true,
        modemsg = true,
      },
    },
  },
}
