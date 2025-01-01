local wezterm = require("wezterm")

local config = {}

config.color_scheme = "tokyonight_night"
config.font_size = 12.0

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = {
	bottom = 0,
}

config.colors = {
	cursor_bg = "#73fa91",
	cursor_border = "#73fa91",
	cursor_fg = "#0f1610",
}

return config
