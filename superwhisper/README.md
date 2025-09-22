# Super Whisper Configuration

Configuration for [Super Whisper](https://superwhisper.com/) - AI-powered voice transcription for macOS.

## Files

- **com.superduper.superwhisper.plist** - Application preferences and settings

## Installation

To restore Super Whisper preferences on a new machine:

```bash
# Convert XML plist back to binary format and install
plutil -convert binary1 ~/Developer/dotfiles/superwhisper/com.superduper.superwhisper.plist -o ~/Library/Preferences/com.superduper.superwhisper.plist

# Restart Super Whisper for changes to take effect
```

## Backup Current Settings

To backup your current Super Whisper settings:

```bash
# Export current preferences to XML format
plutil -convert xml1 ~/Library/Preferences/com.superduper.superwhisper.plist -o ~/Developer/dotfiles/superwhisper/com.superduper.superwhisper.plist
```

## Note

The preference file contains:
- Hotkey configurations
- Model selection preferences
- Output format settings
- Application behavior settings

Models themselves are stored separately in `~/Library/Application Support/superwhisper/` and are not included in this backup due to their large size.