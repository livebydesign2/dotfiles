# Dotfiles

Personal configuration files for macOS development environment.

## Overview

This repository contains configuration files and settings for various development tools and applications used on macOS.

## Directory Structure

```
.
├── aerospace/          # AeroSpace window manager configuration
├── claude/             # Claude AI assistant configuration
├── superwhisper/       # Super Whisper voice transcription configuration
├── wezterm/            # WezTerm terminal emulator configuration
└── README.md
```

## Components

### AeroSpace (`/aerospace`)

Window management configuration for [AeroSpace](https://github.com/nikitabobko/AeroSpace) - a tiling window manager for macOS.

- **aerospace.toml** - Main configuration file with keybindings and workspace settings

### Claude (`/claude`)

Configuration files for Claude AI assistant tools.

- **settings.json** - Claude Code settings including custom statusline
- **statusline.sh** - Custom bash script for Claude Code statusline display
- **claude_desktop_config.json** - MCP (Model Context Protocol) server configurations
- **CLAUDE.md.template** - Template for creating project-specific Claude guidance files

### Super Whisper (`/superwhisper`)

Configuration for [Super Whisper](https://superwhisper.com/) - AI-powered voice transcription for macOS.

- **com.superduper.superwhisper.plist** - Application preferences and settings

### WezTerm (`/wezterm`)

Terminal emulator configuration files for [WezTerm](https://wezfurlong.org/wezterm/).

- **wezterm.lua** - Main configuration file
- Various backup and test configuration files
- **.wezterm.lua** - Alternative configuration file

## Installation

### Clone the Repository

```bash
git clone https://github.com/livebydesign2/dotfiles.git ~/Developer/dotfiles
```

### Setting Up Configurations

#### AeroSpace

```bash
# Copy AeroSpace config
mkdir -p ~/.config/aerospace
cp ~/Developer/dotfiles/aerospace/aerospace.toml ~/.config/aerospace/
```

#### Claude

```bash
# Copy Claude Code settings
mkdir -p ~/.claude
cp ~/Developer/dotfiles/claude/settings.json ~/.claude/
cp ~/Developer/dotfiles/claude/statusline.sh ~/.claude/

# Copy Claude Desktop config
mkdir -p ~/.config/claude
cp ~/Developer/dotfiles/claude/claude_desktop_config.json ~/.config/claude/
```

**Note**: The `claude_desktop_config.json` contains API keys that should be kept secure. Update these with your own keys.

#### Super Whisper

```bash
# Restore Super Whisper preferences
plutil -convert binary1 ~/Developer/dotfiles/superwhisper/com.superduper.superwhisper.plist -o ~/Library/Preferences/com.superduper.superwhisper.plist
```

#### WezTerm

```bash
# Copy WezTerm config
mkdir -p ~/.config/wezterm
cp ~/Developer/dotfiles/wezterm/wezterm.lua ~/.config/wezterm/

# Or use the alternative config
cp ~/Developer/dotfiles/wezterm/.wezterm.lua ~/
```

## Usage

### Creating Project-Specific Claude Guidance

Use the provided template to create a `CLAUDE.md` file in your project root:

```bash
cp ~/Developer/dotfiles/claude/CLAUDE.md.template /path/to/your/project/CLAUDE.md
# Edit the file to add project-specific context
```

### Updating Configurations

To update your dotfiles after making local changes:

```bash
cd ~/Developer/dotfiles

# For AeroSpace
cp ~/.config/aerospace/aerospace.toml aerospace/

# For Claude
cp ~/.claude/settings.json claude/
cp ~/.claude/statusline.sh claude/
cp ~/.config/claude/claude_desktop_config.json claude/

# For Super Whisper
plutil -convert xml1 ~/Library/Preferences/com.superduper.superwhisper.plist -o ~/Developer/dotfiles/superwhisper/com.superduper.superwhisper.plist

# For WezTerm
cp ~/.config/wezterm/wezterm.lua wezterm/

# Commit and push changes
git add .
git commit -m "Update configurations"
git push
```

## Security Considerations

- **API Keys**: The `claude_desktop_config.json` file contains API keys. Ensure this repository is private or remove sensitive data before sharing.
- Consider using environment variables or a secrets manager for API keys in production environments.

## Requirements

- macOS
- [AeroSpace](https://github.com/nikitabobko/AeroSpace) (for window management)
- [WezTerm](https://wezfurlong.org/wezterm/) (for terminal emulation)
- [Claude](https://claude.ai) desktop app or Claude Code CLI
- [Super Whisper](https://superwhisper.com/) (for voice transcription)

## Contributing

This is a personal configuration repository, but suggestions and improvements are welcome through issues or pull requests.

## License

Personal use configuration files - use at your own discretion.