local wezterm = require 'wezterm';

local key_maps = {
  { key="s", mods="CTRL|SHIFT", action="ToggleFullScreen" },
  { key="l", mods="LEADER", action="ShowLauncher" },
  { key="R", mods="LEADER|SHIFT", action= "ReloadConfiguration" },
  { key="x", mods="LEADER", action=wezterm.action{ CloseCurrentPane={ confirm=false } } },
  { key="%", mods="LEADER|SHIFT", action=wezterm.action{ SplitVertical={ domain="CurrentPaneDomain" } } },
  { key="\"", mods="LEADER|SHIFT", action=wezterm.action{ SplitHorizontal={ domain="CurrentPaneDomain" } } },
}

return {
  -- timeout_milliseconds defaults to 1000 and can be omitted
  leader = { key="a", mods="CTRL", timeout_milliseconds=1000 },
  color_scheme = "MaterialDark",
  font = wezterm.font("JetBrains Mono", {bold=false, italic=false}),
  font_size = 11.0,
  keys = key_maps,
  use_dead_keys = false,
  disable_default_key_bindings = false,
}
