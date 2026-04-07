#!/usr/bin/env bash
# Remove all claudomate launchd jobs from the launchd system (plists stay on disk).
DIR="$(cd "$(dirname "$0")" && pwd)"
for plist in "$DIR"/*.plist; do
  [[ -e "$plist" ]] || continue
  label=$(defaults read "$plist" Label 2>/dev/null)
  [[ -z "$label" ]] && continue
  launchctl remove "$label" && echo "removed: $label"
done
