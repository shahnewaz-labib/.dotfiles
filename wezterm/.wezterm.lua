local wezterm = require("wezterm")
local config = {}

config.color_scheme = "tokyonight_night"

config.font = wezterm.font("JetBrainsMono NF")
config.font_size = 16

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = {
	bottom = 0,
}

return config
