#!/usr/bin/env bash
# Unload all claudomate launchd plists in this directory (jobs remain on disk).
DIR="$(cd "$(dirname "$0")" && pwd)"
for plist in "$DIR"/*.plist; do
  [[ -e "$plist" ]] || continue
  launchctl unload "$plist" 2>/dev/null && echo "unloaded: $(basename "$plist")"
done
