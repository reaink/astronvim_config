local new_bee_alpha_config = require "plugins.alpha_themes.new_bee"
local rainbow_cat_alpha_config = require "plugins.alpha_themes.rainbow_cat"
local panda_alpha_config = require "plugins.alpha_themes.panda"

---@type LazySpec
return {
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      math.randomseed(os.time())
      local theme = ({ panda_alpha_config, rainbow_cat_alpha_config, new_bee_alpha_config })[math.random(1, 3)]
      return theme(opts)
    end,
  },
}
