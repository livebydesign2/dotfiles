local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- ============================================================================
-- APPEARANCE
-- ============================================================================
config.color_scheme = 'Tokyo Night'
config.font = wezterm.font('JetBrains Mono', { weight = 'Medium' })
config.font_size = 14
config.window_background_opacity = 0.95
config.macos_window_background_blur = 20
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

-- ============================================================================
-- NOTIFICATIONS & ALERTS
-- ============================================================================
config.audible_bell = 'SystemBeep'
config.visual_bell = {
  fade_in_function = 'Constant',
  fade_in_duration_ms = 0,
  fade_out_function = 'Constant', 
  fade_out_duration_ms = 0,
  target = 'BackgroundColor',
}

-- ============================================================================
-- SESSION PERSISTENCE WITH RESURRECT.WEZTERM
-- ============================================================================
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")

-- Configure resurrect with these options
resurrect.periodic_save({
  interval_seconds = 300,  -- Auto-save every 5 minutes
  save_workspace = true,
  save_window = true,
  save_tabs = true,
  save_panes = true,
})

-- ============================================================================
-- LEADER KEY (for session commands)
-- ============================================================================
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

-- ============================================================================
-- KEY BINDINGS
-- ============================================================================
config.keys = {
  -- ========== SESSION PERSISTENCE (Leader + Key) ==========
  {
    key = 's',
    mods = 'LEADER',
    action = wezterm.action({ EmitEvent = "resurrect.save_state" })
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = wezterm.action({ EmitEvent = "resurrect.fuzzy_load" })
  },
  {
    key = 'd',
    mods = 'LEADER',
    action = wezterm.action({ EmitEvent = "resurrect.delete_state" })
  },
  
  -- ========== PANE SPLITTING ==========
  {
    key = '|',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  {
    key = '_',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  
  -- ========== PANE NAVIGATION ==========
  {
    key = 'H',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Left'
  },
  {
    key = 'J',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Down'
  },
  {
    key = 'K',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Up'
  },
  {
    key = 'L',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Right'
  },
  
  -- ========== PANE RESIZING ==========
  {
    key = 'LeftArrow',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.AdjustPaneSize { 'Left', 5 }
  },
  {
    key = 'DownArrow',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.AdjustPaneSize { 'Down', 5 }
  },
  {
    key = 'UpArrow',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.AdjustPaneSize { 'Up', 5 }
  },
  {
    key = 'RightArrow',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.AdjustPaneSize { 'Right', 5 }
  },
  
  -- ========== PANE MANAGEMENT ==========
  {
    key = 'X',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = true }
  },
  {
    key = 'Z',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.TogglePaneZoomState
  },
  {
    key = 'F',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ToggleFullScreen
  },
  {
    key = '}',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.PaneSelect
  },
  
  -- ========== TAB MANAGEMENT ==========
  {
    key = 'C',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain'
  },
  {
    key = 'N',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTabRelative(1)
  },
  {
    key = 'P',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTabRelative(-1)
  },
  {
    key = 'Q',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentTab { confirm = true }
  },
  
  -- ========== WORKSPACE MANAGEMENT ==========
  {
    key = 'W',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' }
  },
  
  -- ========== COPY/PASTE ==========
  {
    key = 'v',
    mods = 'CMD',
    action = wezterm.action.PasteFrom 'Clipboard'
  },
  {
    key = 'c',
    mods = 'CMD',
    action = wezterm.action.CopyTo 'Clipboard'
  },
  
  -- ========== QUICK ACCESS ==========
  {
    key = 'R',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ReloadConfiguration
  },
  {
    key = 'D',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ShowDebugOverlay
  },
  
  -- ========== macOS STYLE SHORTCUTS ==========
  {
    key = 'Enter',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  {
    key = 'Enter',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  {
    key = 't',
    mods = 'CMD',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain'
  },
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentTab { confirm = true }
  },
  {
    key = 'LeftArrow',
    mods = 'CMD',
    action = wezterm.action.ActivateTabRelative(-1)
  },
  {
    key = 'RightArrow',
    mods = 'CMD',
    action = wezterm.action.ActivateTabRelative(1)
  },
  
  -- ========== NUMBER KEY TAB SELECTION ==========
  {
    key = '1',
    mods = 'CMD',
    action = wezterm.action.ActivateTab(0)
  },
  {
    key = '2',
    mods = 'CMD',
    action = wezterm.action.ActivateTab(1)
  },
  {
    key = '3',
    mods = 'CMD',
    action = wezterm.action.ActivateTab(2)
  },
  {
    key = '4',
    mods = 'CMD',
    action = wezterm.action.ActivateTab(3)
  },
  {
    key = '5',
    mods = 'CMD',
    action = wezterm.action.ActivateTab(4)
  },
  {
    key = '6',
    mods = 'CMD',
    action = wezterm.action.ActivateTab(5)
  },
  {
    key = '7',
    mods = 'CMD',
    action = wezterm.action.ActivateTab(6)
  },
  {
    key = '8',
    mods = 'CMD',
    action = wezterm.action.ActivateTab(7)
  },
  {
    key = '9',
    mods = 'CMD',
    action = wezterm.action.ActivateTab(8)
  },
}

-- ============================================================================
-- AUTO-RESTORE ON STARTUP
-- ============================================================================
wezterm.on("gui-startup", function()
  -- Automatically restore last saved session on startup
  local success, saved_state = wezterm.run_child_process({ 
    'ls', wezterm.home_dir .. '/.local/share/wezterm/resurrect/state/'
  })
  if success then
    -- If there are saved states, restore the most recent one
    wezterm.emit("resurrect.fuzzy_load")
  end
end)

return config