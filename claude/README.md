# Claude Desktop Configuration

This directory contains configuration files for Claude Desktop with MCP server integrations.

## Security Notice

API keys and sensitive credentials should NEVER be committed to version control. This configuration uses environment variables to keep your credentials secure.

## Setup Instructions

1. **Run the setup script:**
   ```bash
   ./setup.sh
   ```

2. **Add your API keys to the `.env` file:**
   ```bash
   # Edit the .env file (created from .env.example)
   nano .env
   # Add your actual Notion API key
   ```

3. **Source the environment variables:**
   ```bash
   source .env
   export NOTION_API_KEY
   ```

   Or add to your shell profile for automatic loading:
   ```bash
   echo '[ -f ~/Developer/dotfiles/claude/.env ] && source ~/Developer/dotfiles/claude/.env' >> ~/.zshrc
   ```

## Files

- `claude_desktop_config.json` - Main configuration file (uses environment variables)
- `.env.example` - Template for environment variables
- `.env` - Your actual environment variables (NEVER COMMIT THIS)
- `setup.sh` - Setup script for initial configuration

## MCP Servers Configured

- **Notion** - Integrates with Notion API for workspace access
- **Browser Tools** - Provides browser automation capabilities

## Important Security Practices

1. Always use environment variables for sensitive data
2. Never commit `.env` files to version control
3. Regularly rotate API keys
4. Use `.gitignore` to prevent accidental commits
5. Review commits before pushing to ensure no secrets are included