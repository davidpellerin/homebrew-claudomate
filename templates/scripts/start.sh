#!/usr/bin/env bash
# Ensures the tmux window for this repo exists with Claude running.
REPO="$(cd "$(dirname "$0")/../.." && pwd)"
TMUX_BIN="@@TMUX_BIN@@"
TMUX_SOCK="/tmp/tmux-$(id -u)/default"
WINDOW="$(basename "$REPO")"
CLAUDE_BIN="$(command -v claude || echo /opt/homebrew/bin/claude)"
CLAUDE_MODEL="${CLAUDOMATE_MODEL:-haiku}"

if $TMUX_BIN -S "$TMUX_SOCK" list-windows -F '#{window_name}' 2>/dev/null | grep -q "^${WINDOW}$"; then
  echo "Window '$WINDOW' already running."
else
  echo "Creating window '$WINDOW' with Claude..."
  $TMUX_BIN -S "$TMUX_SOCK" new-window -d -n "$WINDOW" \
    "cd $REPO && $CLAUDE_BIN --model $CLAUDE_MODEL --dangerously-skip-permissions"
fi
