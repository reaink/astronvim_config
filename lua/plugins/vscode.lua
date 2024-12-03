if not vim.g.vscode then return {} end -- don't do anything in non-vscode instances

return {
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      local maps = assert(opts.mappings)
      maps.n["<C-s>"] = function() require("vscode-neovim").action "workbench.action.files.save" end
      maps.x["<C-s>"] = function() require("vscode-neovim").action "workbench.action.files.save" end
    end,
  },
  {
    "catppuccin/nvim",
    enabled = false,
  },
}
