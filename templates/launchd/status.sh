#!/usr/bin/env bash
# Show launchctl status for all claudomate launchd jobs in this directory.
DIR="$(cd "$(dirname "$0")" && pwd)"
for plist in "$DIR"/*.plist; do
  [[ -e "$plist" ]] || continue
  label=$(defaults read "$plist" Label 2>/dev/null)
  [[ -z "$label" ]] && continue
  info=$(launchctl list "$label" 2>/dev/null)
  if [[ -z "$info" ]]; then
    echo "not loaded: $label"
  else
    pid=$(echo "$info" | awk '/"PID"/ {gsub(/[^0-9]/, "", $NF); print $NF}')
    last_exit=$(echo "$info" | awk '/"LastExitStatus"/ {gsub(/[^0-9-]/, "", $NF); print $NF}')
    if [[ -n "$pid" ]]; then
      echo "running (pid $pid): $label"
    else
      echo "loaded, not running (last exit: ${last_exit:-?}): $label"
    fi
  fi
done
