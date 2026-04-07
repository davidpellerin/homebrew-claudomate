#!/usr/bin/env bash
# Show crontab status for claudomate jobs in this directory.
DIR="$(cd "$(dirname "$0")" && pwd)"

for cron_file in "$DIR"/*.cron; do
  [[ -e "$cron_file" ]] || continue
  label=$(grep "^# claudomate:" "$cron_file" | head -1 | sed 's/^# claudomate://')
  [[ -n "$label" ]] || continue
  cmd=$(awk 'NF && !/^#/ {print $6; exit}' "$cron_file")
  if crontab -l 2>/dev/null | grep -qF "$cmd"; then
    echo "installed: $label"
    echo "schedule: $(crontab -l 2>/dev/null | grep -F "$cmd")"
  else
    echo "not installed: $label"
  fi
done
