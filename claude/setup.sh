#!/bin/bash

# Claude Desktop Configuration Setup Script
# This script helps set up environment variables for Claude Desktop

echo "Claude Desktop Configuration Setup"
echo "=================================="
echo ""

# Check if .env file exists
if [ ! -f ".env" ]; then
    echo "Creating .env file from template..."
    cp .env.example .env
    echo "✓ .env file created"
    echo ""
fi

echo "Please add your Notion API key to the .env file:"
echo "  1. Open .env in your editor"
echo "  2. Replace 'your_notion_api_key_here' with your actual API key"
echo "  3. Save the file"
echo ""
echo "To use the environment variable in Claude Desktop:"
echo "  1. Source the .env file: source .env"
echo "  2. Export the variable: export NOTION_API_KEY"
echo ""
echo "Or add this to your shell profile (~/.zshrc or ~/.bash_profile):"
echo "  [ -f ~/Developer/dotfiles/claude/.env ] && source ~/Developer/dotfiles/claude/.env"
echo ""
echo "IMPORTANT: Never commit the .env file to version control!"