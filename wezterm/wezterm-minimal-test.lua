local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Minimal config for testing
config.color_scheme = 'Tokyo Night'
config.font_size = 14

-- Test key bindings only
config.keys = {
  -- Simple test binding
  {
    key = 'F1',
    action = wezterm.action.ShowDebugOverlay
  },
  {
    key = 't',
    mods = 'CMD',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain'
  },
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentTab { confirm = false }
  },
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  {
    key = 'D',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
  },
}

return config