#!/usr/bin/env bash
# Load all claudomate launchd plists in this directory.
DIR="$(cd "$(dirname "$0")" && pwd)"
for plist in "$DIR"/*.plist; do
  [[ -e "$plist" ]] || continue
  launchctl load "$plist" && echo "loaded: $(basename "$plist")"
done
