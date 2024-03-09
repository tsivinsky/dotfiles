local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "ayu"

config.enable_tab_bar = false
config.enable_wayland = true

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.font = wezterm.font("JetBrains Mono", {
  weight = "Medium",
})

config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

return config
