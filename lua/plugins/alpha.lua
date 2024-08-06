local rainbow_cat_theme = require "plugins.alpha_themes.rainbow_cat"

---@type LazySpec
return {
  {
    "goolord/alpha-nvim",
    opts = function(_, opts) return rainbow_cat_theme.rainbow_cat_alpha_config(opts) end,
  },
}
