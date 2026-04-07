#!/usr/bin/env bash
# Manually load all claudomate launchd plists in this directory.
# Run this if you don't have claudomate installed.
DIR="$(cd "$(dirname "$0")" && pwd)"
for plist in "$DIR"/*.plist; do
  [[ -e "$plist" ]] || continue
  launchctl load "$plist" && echo "loaded: $(basename "$plist")"
done
