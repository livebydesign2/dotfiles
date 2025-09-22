local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- ============================================================================
-- SESSION PERSISTENCE WITH RESURRECT
-- ============================================================================
-- First load the dev dependency that resurrect needs
local dev = wezterm.plugin.require("https://github.com/chrisgve/dev.wezterm")
-- Then load resurrect
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")


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
-- Enable audible bell (system beep/bounce dock icon when bell character received)
config.audible_bell = 'SystemBeep'

-- Visual bell configuration (flash effect when bell character is received)
-- This creates a brief visual flash to alert you
config.visual_bell = {
  fade_in_function = 'Constant',
  fade_in_duration_ms = 0,
  fade_out_function = 'Constant', 
  fade_out_duration_ms = 0,
  target = 'BackgroundColor',
}

-- On macOS, when a bell is triggered:
-- 1. The dock icon will bounce if WezTerm is not in focus
-- 2. A system beep will play (if not muted)
-- 3. A brief visual flash will occur in the terminal

-- To test: run 'echo -e "\a"' in the terminal or wait for a command to complete

-- ============================================================================
-- LEADER KEY
-- ============================================================================
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

-- ============================================================================
-- KEY BINDINGS
-- ============================================================================
config.keys = {
  -- ========== TEST KEY ==========
  {
    key = 'F1',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain'
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
  {
    key = 'O',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ShowLauncherArgs { flags = 'FUZZY|DOMAINS' }
  },
  
  -- ========== SESSION PERSISTENCE ==========
  -- Save current session (CMD+S on Mac)
  {
    key = 's',
    mods = 'CMD|SHIFT',
    action = wezterm.action({ EmitEvent = "resurrect.save_state" })
  },
  -- Load session with fuzzy finder (CMD+O like "Open")
  {
    key = 'o',
    mods = 'CMD|SHIFT',
    action = wezterm.action({ EmitEvent = "resurrect.fuzzy_load" })
  },
  -- Delete saved session
  {
    key = 'd',
    mods = 'CMD|SHIFT|ALT',
    action = wezterm.action({ EmitEvent = "resurrect.delete_state" })
  },
  
  -- ========== SESSION PERSISTENCE (CTRL+SHIFT BINDINGS) ==========
  -- Save current session
  {
    key = 'S',
    mods = 'CTRL|SHIFT',
    action = wezterm.action({ EmitEvent = "resurrect.save_state" })
  },
  -- Load session with fuzzy finder
  {
    key = 'M',
    mods = 'CTRL|SHIFT',
    action = wezterm.action({ EmitEvent = "resurrect.fuzzy_load" })
  },
  -- Delete saved session
  {
    key = 'E',
    mods = 'CTRL|SHIFT',
    action = wezterm.action({ EmitEvent = "resurrect.delete_state" })
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
  
  -- ========== SCROLLING ==========
  {
    key = 'u',
    mods = 'CTRL',
    action = wezterm.action.DisableDefaultAssignment
  },
  {
    key = 'd',
    mods = 'CTRL',
    action = wezterm.action.ScrollByPage(0.5)
  },
  
  -- ========== CUSTOM LEADER KEY SCROLLING (SHIFT|CTRL) ==========
  {
    key = 'Home',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.ScrollToTop
  },
  {
    key = 'End',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.ScrollToBottom
  },
  {
    key = 'PageUp',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.ScrollByPage(-0.1)
  },
  {
    key = 'PageDown',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.ScrollByPage(0.1)
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
-- SESSION PERSISTENCE SETUP
-- ============================================================================

-- Configure encryption (using age)
resurrect.state_manager.set_encryption({
  enable = true,  -- Enable encryption
  method = "age",  -- Use age encryption
  private_key = wezterm.home_dir .. "/.config/wezterm/resurrect_key.txt",
  public_key = "age1smjyw2atn6hmvsvvseghsmf30cpgzmau66xemnzv3myunednqg3sn3gf9x",  -- Your generated public key
})

-- Setup periodic auto-save
resurrect.state_manager.periodic_save({
  interval_seconds = 300,  -- Auto-save every 5 minutes
  save_workspaces = true,
  save_tabs = true,
  save_panes = true,
})

-- Automatic session resurrection on startup
wezterm.on("gui-startup", function()
  resurrect.state_manager.resurrect_on_gui_startup()
end)

-- Event handlers for save/load/delete
wezterm.on("resurrect.save_state", function(window, pane)
  local state = resurrect.workspace_state.get_workspace_state()
  resurrect.state_manager.save_state(state)
  wezterm.log_info("State saved successfully")
  if window and window.toast_notification then
    window:toast_notification("WezTerm", "Session saved successfully", nil, 2000)
  end
end)

wezterm.on("resurrect.fuzzy_load", function(window, pane)
  resurrect.fuzzy_loader.fuzzy_load(
    window,
    pane,
    function(id)
      local state = resurrect.state_manager.load_state(id)
      resurrect.workspace_state.restore_workspace(state)
    end,
    {
      title = "Load Session",
      description = "Select session to load and press Enter = accept, Esc = cancel, / = filter",
      fuzzy_description = "Search session: ",
      is_fuzzy = true,
    }
  )
end)

wezterm.on("resurrect.delete_state", function(window, pane)
  resurrect.fuzzy_loader.fuzzy_load(
    window,
    pane,
    function(id)
      resurrect.state_manager.delete_state(id)
      wezterm.log_info("State deleted: " .. id)
      if window and window.toast_notification then
        window:toast_notification("WezTerm", "Session deleted: " .. id, nil, 2000)
      end
    end,
    {
      title = "Delete Session",
      description = "Select session to delete and press Enter = accept, Esc = cancel, / = filter",
      fuzzy_description = "Search session to delete: ",
      is_fuzzy = true,
    }
  )
end)

return config