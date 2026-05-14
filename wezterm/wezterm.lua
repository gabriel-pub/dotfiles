local wezterm = require("wezterm")

local config = wezterm.config_builder()
config:set_strict_mode(true)

if wezterm.gui then
  config.initial_cols = 100
  config.initial_rows = 30

  config.launch_menu = {
    {
      label = "btop",
      args = { "/opt/homebrew/bin/btop" },
    },
    {
      label = "zsh",
      args = { "zsh", "-l" },
    },
  }

  config.keys = {
    {
      key = "p",
      mods = "CMD",
      action = wezterm.action.ShowLauncher,
    },
  }

  config.font_size = 18
  local appearance = wezterm.gui.get_appearance()
  if appearance:find("Dark") then
    config.color_scheme = "GruvboxDark"
  else
    config.color_scheme = "GruvboxLight"
  end

  config.set_environment_variables = {
    THEME_MODE = wezterm.gui.get_appearance():lower():find("dark") and "dark"
      or "light",
  }

  config.enable_tab_bar = false
  config.window_decorations = "RESIZE"

  local font_name = "JetBrainsMono Nerd Font"
  config.font = wezterm.font(font_name)

  local home = "/Users/gabriel"
  local dev = "/dev"
  config.default_cwd = home .. dev
end

return config
