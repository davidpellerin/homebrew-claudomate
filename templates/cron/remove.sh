#!/usr/bin/env bash
# Remove claudomate crontab entries for *.cron files in this directory.
DIR="$(cd "$(dirname "$0")" && pwd)"

for cron_file in "$DIR"/*.cron; do
  [[ -e "$cron_file" ]] || continue
  label=$(grep "^# claudomate:" "$cron_file" | head -1 | sed 's/^# claudomate://')
  [[ -n "$label" ]] || continue
  cmd=$(awk 'NF && !/^#/ {print $6; exit}' "$cron_file")
  ( crontab -l 2>/dev/null | grep -v "claudomate:$label" | grep -vF "$cmd" ) | crontab -
  echo "removed cron job: $label"
done
