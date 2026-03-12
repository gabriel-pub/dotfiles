-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- Initial geometry for new windows:
config.initial_cols = 100
config.initial_rows = 30

-- or, changing the font size and color scheme.
config.font_size = 16
config.color_scheme = "GruvboxDark"

-- Other appearances
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.3
config.macos_window_background_blur = 20
config.window_decorations = "RESIZE"

-- Fonts
config.font = wezterm.font("FiraCode Nerd Font")

-- Actual productivity stuff
config.default_cwd = "/Users/gabriel/dev"

-- Finally, return the configuration to wezterm:
return config
