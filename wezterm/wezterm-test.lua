local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Basic appearance
config.color_scheme = 'Tokyo Night'
config.font = wezterm.font('JetBrains Mono', { weight = 'Medium' })
config.font_size = 14

-- Test the essential keybindings
config.keys = {
  -- Horizontal split (CTRL+SHIFT+|)
  {
    key = '|',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  -- Vertical split (CTRL+SHIFT+_)
  {
    key = '_',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  -- Reload config (CTRL+SHIFT+R)
  {
    key = 'R',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ReloadConfiguration
  },
}

return config