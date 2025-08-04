local wezterm = require("wezterm")
local config = {}

-- config.color_scheme = "tokyonight_night"
config.font = wezterm.font("JetBrainsMono NF")
-- config.font = wezterm.font("Menlo")
config.font_size = 19
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = {
  bottom = 0,
}

config.default_cursor_style = "SteadyBar"
config.cursor_blink_rate = 800

-- overridden colors
config.colors = {
  cursor_bg = "#73fa91",
  cursor_border = "#73fa91",
  cursor_fg = "#0f1610",
}

-- custom palette
-- Palette order:
-- 1. 161617, 2. C9C7CD, 3. 90B99F, 4. 85B5BA, 5. 92A2D5,
-- 6. ACA1CF, 7. E29ECA, 8. EA83A5, 9. F5A191, 10. E6B99D
local custom_colors = {
  -- Set foreground and background
  background = "#161617",  -- Palette index 1
  foreground = "#C9C7CD",  -- Palette index 2

  -- Selection colors
  selection_bg = "#92A2D5",  -- Palette index 5
  selection_fg = "#161617",  -- Matching background

  -- Standard ANSI colors
  ansi = {
    "#161617",
    "#EA83A5",
    "#90B99F",
    "#F5A191",
    "#92A2D5",
    "#ACA1CF",
    "#85B5BA",
    "#C9C7CD",
  },

  -- Bright ANSI colors
  brights = {
    "#8b8592",
    "#E29ECA",
    "#90B99F",
    "#F5A191",
    "#92A2D5",
    "#ACA1CF",
    "#85B5BA",
    "#C9C7CD",
  },
}

-- Merge the custom colors into config.colors,
-- preserving any keys already set (like cursor colors)
-- for key, value in pairs(custom_colors) do
--   if config.colors[key] == nil then
--     config.colors[key] = value
--   end
-- end

config.color_scheme = "GruvboxDark"

return config
