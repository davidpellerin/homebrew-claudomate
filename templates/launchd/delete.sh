#!/usr/bin/env bash
# Manually unload all claudomate launchd plists in this directory.
# Run this to remove the jobs without fully uninstalling claudomate.
DIR="$(cd "$(dirname "$0")" && pwd)"
for plist in "$DIR"/*.plist; do
  [[ -e "$plist" ]] || continue
  launchctl unload "$plist" 2>/dev/null && echo "unloaded: $(basename "$plist")"
done
