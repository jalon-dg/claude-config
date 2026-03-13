#!/bin/bash
# Install subagent-monitor skill and hook
# Usage: ./install-subagent-monitor.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
SKILLS_DIR="$CLAUDE_DIR/skills"
BIN_SOURCE="$SCRIPT_DIR/subagent-monitor.sh"
BIN_TARGET="$HOME/.local/bin/subagent-monitor"

echo "=== Installing subagent-monitor ==="

# Create bin directory if needed
mkdir -p "$HOME/.local/bin"

# Link the monitor script
if [ -f "$BIN_SOURCE" ]; then
    rm -f "$BIN_TARGET"
    ln -sf "$BIN_SOURCE" "$BIN_TARGET"
    echo "✓ Installed subagent-monitor command"
fi

# Copy skill to Claude skills directory
SKILL_SOURCE="$SCRIPT_DIR/../skills/subagent-monitor"
SKILL_TARGET="$SKILLS_DIR/subagent-monitor"

if [ -d "$SKILL_SOURCE" ]; then
    rm -rf "$SKILL_TARGET"
    cp -r "$SKILL_SOURCE" "$SKILL_TARGET"
    echo "✓ Installed subagent-monitor skill"
fi

echo ""
echo "=== Installation Complete ==="
echo ""
echo "Usage:"
echo "  subagent-monitor           # Run monitor"
echo ""
echo "Or use the skill via Claude Code:"
echo "  /subagent-monitor          # Query subagent status"
echo ""