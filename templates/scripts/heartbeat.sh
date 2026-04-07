#!/usr/bin/env bash
# Runs on a schedule via launchd. Works without claudomate installed.
REPO="$(cd "$(dirname "$0")/../.." && pwd)"
TMUX_BIN="@@TMUX_BIN@@"
TMUX_SOCK="/tmp/tmux-$(id -u)/default"
WINDOW="$(basename "$REPO")"
FILE="$REPO/HEARTBEAT.md"

[[ -f "$FILE" ]] || { echo "heartbeat.sh: $FILE not found" >&2; exit 1; }

prompt="Read the file $FILE and execute every task listed in it."
$TMUX_BIN -S "$TMUX_SOCK" send-keys -t "$WINDOW" "/new" Enter
sleep 2
$TMUX_BIN -S "$TMUX_SOCK" send-keys -t "$WINDOW" "$prompt" Enter
