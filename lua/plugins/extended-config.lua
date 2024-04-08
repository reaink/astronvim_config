---@type LazySpec
return {
  {
    "nvim-telescope/telescope.nvim",
    version = "90143d3",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
    },
    opts = function(_, opts)
      local actions = require "telescope.actions"
      opts.pickers = {
        buffers = {
          theme = "dropdown",
          mappings = {
            i = {
              ["<c-h>"] = "delete_buffer",
            },
            n = {
              ["<c-h>"] = "delete_buffer",
            },
          },
        },
        find_files = {
          theme = "dropdown",
          previewer = false,
          hidden = true,
        },
        git_files = {
          show_untracked = true,
          theme = "ivy",
        },
        live_grep = {
          theme = "ivy",
        },
        lsp_definitions = {
          theme = "cursor",
        },
        lsp_references = {
          theme = "cursor",
        },
      }
      opts.defaults = {
        hidden = true,
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",

        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        path_display = {
          filename_first = {
            reverse_directories = true,
          },
        },
        mappings = {
          i = {
            ["<esc>"] = "close",
            ["<c-g>"] = "close",
            ["<c-t>"] = require("trouble.sources.telescope").open,
            ["<C-n>"] = actions.move_selection_next,
            ["<C-p>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.cycle_history_next,
            ["<C-k>"] = actions.cycle_history_prev,
          },
          n = {
            ["<c-t>"] = require("trouble.sources.telescope").open,
          },
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--hidden",
          "--smart-case",
        },
        file_ignore_patterns = {
          "%.git/.*",
          "%.vim/.*",
          "node_modules/.*",
          "%.idea/.*",
          "%.vscode/.*",
          "%.history/.*",
        },
      }
    end,
  },
  {
    "xlboy/text-case.nvim",
    event = "User AstroFile",
    opts = {},
    config = function()
      require("textcase").setup {}
      local telescope = require "telescope"
      telescope.load_extension "textcase"

      vim.api.nvim_set_keymap("n", "ga.", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })
      vim.api.nvim_set_keymap("v", "ga.", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })
      vim.api.nvim_set_keymap(
        "n",
        "gaa",
        "<cmd>TextCaseOpenTelescopeQuickChange<CR>",
        { desc = "Telescope Quick Change" }
      )
      vim.api.nvim_set_keymap("n", "gai", "<cmd>TextCaseOpenTelescopeLSPChange<CR>", { desc = "Telescope LSP Change" })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function() require("telescope").load_extension "fzf" end,
    },
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function() require("telescope").load_extension "frecency" end,
  },
  {
    "debugloop/telescope-undo.nvim",
    keys = {
      { "<leader>fu", "<cmd>Telescope undo<cr>", desc = "Find undo" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },
  {
    "s1n7ax/nvim-window-picker",
    opts = {
      hint = "floating-big-letter",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    opts = function(_, opts)
      local cmp = require "cmp"
      opts.completion = {
        completeopt = "menu,menuone,noinsert",
      }
      opts.sources = cmp.config.sources {
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
        { name = "emoji", priority = 700 },
      }
      return opts
    end,
  },
}
