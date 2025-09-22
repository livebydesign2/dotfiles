#!/bin/bash

# Read the JSON input from stdin
input=$(cat)

# Extract information from JSON
model_name=$(echo "$input" | jq -r '.model.display_name // .model.id')
current_dir=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
session_id=$(echo "$input" | jq -r '.session_id')
transcript_path=$(echo "$input" | jq -r '.transcript_path')

# Get current directory basename
dir_name=$(basename "$current_dir")

# Get token usage from transcript if available
token_info=""
if [[ -f "$transcript_path" && -r "$transcript_path" ]]; then
    # Try to extract token usage from the last few lines of the transcript
    token_usage=$(tail -20 "$transcript_path" 2>/dev/null | grep -o '[0-9,]\+[[:space:]]*tokens\?[[:space:]]*used\|used[[:space:]]*[0-9,]\+[[:space:]]*tokens\?' | tail -1 | sed 's/[[:space:]]*tokens\?[[:space:]]*/ tokens /' | sed 's/used[[:space:]]*//' | sed 's/[[:space:]]*used//')
    if [[ -n "$token_usage" ]]; then
        token_info="$token_usage"
    fi
fi

# If no token info found, show session indicator
if [[ -z "$token_info" ]]; then
    short_session=$(echo "$session_id" | cut -c1-8)
    token_info="session:$short_session"
fi

# Check for current feature/branch (git-based detection)
feature=""
if command -v git >/dev/null 2>&1 && git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    branch=$(git branch --show-current 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    if [[ -n "$branch" && "$branch" != "main" && "$branch" != "master" ]]; then
        # Extract feature name from branch (e.g., feature/auth -> auth, feat-login -> login)
        feature=$(echo "$branch" | sed -E 's/^(feature|feat)[-\/]?//i' | sed 's/[-_]/ /g')
    fi
fi

# Build the statusline
statusline=""

# 1. Model Name
statusline="$model_name"

# 2. Token usage
if [[ -n "$token_info" ]]; then
    statusline="$statusline | $token_info"
fi

# 3. Current directory
statusline="$statusline | $dir_name"

# 4. Feature (if applicable)
if [[ -n "$feature" ]]; then
    statusline="$statusline | feat:$feature"
fi

# Output the statusline
printf "%s" "$statusline"