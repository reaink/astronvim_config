local themes = {
  "april_fools",
  "arcade",
  "art",
  "bakery",
  "beach",
  "binary",
  "bugs",
  "business",
  "candy",
  "cards",
  "carnival",
  "casino",
  "cats",
  "coffee",
  "cyberpunk",
  "deepsea",
  "desert",
  "dice",
  "diner",
  "easter",
  "emotional",
  "explorer",
  "fantasy",
  "farm",
  "garden",
  "halloween",
  "jungle",
  "leaves",
  "lunar",
  "magical",
  "mathematical",
  "matrix",
  "medieval",
  "musical",
  "mystery",
  "mystical",
  "new_year",
  "nocturnal",
  "ocean",
  "pirate",
  "retro",
  "snow",
  "spa",
  "space",
  "sports",
  "spring",
  "stars",
  "steampunk",
  "st_patricks_day",
  "summer",
  "temporal",
  "us_thanksgiving",
  "travel",
  "tropical",
  "urban",
  "us_independence_day",
  "valentines_day",
  "wilderness",
  "wildwest",
  "winter_wonderland",
  "xmas",
  "zodiac",
  "zoo",
}
local function pickTheme() return (themes)[math.random(1, 3)] end

return {
  {
    "catdadcode/drop.nvim",
    opts = function(_, opts)
      local thanksgiving_day = require("drop").calculate_us_thanksgiving(os.date "%Y")
      opts.theme = pickTheme()
      opts.holidays = {
        halloween = {
          start_date = { month = 10, day = 1 },
          end_date = { month = 10, day = 31 },
        },
        us_thanksgiving = {
          start_date = { month = 11, day = 10 },
          end_date = thanksgiving_day,
        },
        xmas = {
          start_date = { month = 12, day = 1 },
          end_date = { month = 12, day = 25 },
        },
      }
      -- opts.filetypes = { "dashboard" }
      opts.filetypes = {}
      opts.screensaver = (1000 * 60) * 30 --minutes
    end,
  },
}
