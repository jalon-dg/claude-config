#!/bin/bash
# Install fork command - Open directory with Fork app

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FORK_SOURCE="$SCRIPT_DIR/fork"
FORK_TARGET="$HOME/.local/bin/fork"

# Check if Fork.app is installed
if [ ! -d "/Applications/Fork.app" ]; then
    echo "Error: Fork.app is not installed."
    echo "Please install Fork from: https://gitfork.com"
    exit 1
fi

# Check if fork script exists
if [ ! -f "$FORK_SOURCE" ]; then
    echo "Error: fork script not found at $FORK_SOURCE"
    exit 1
fi

# Make sure .local/bin exists
mkdir -p "$HOME/.local/bin"

# Create symlink
rm -f "$FORK_TARGET"
ln -sf "$FORK_SOURCE" "$FORK_TARGET"

echo "fork command installed successfully!"
echo "Usage: fork . or fork /path/to/dir"