#!/usr/bin/env bash
# Show crontab status for claudomate jobs in this repo.
DIR="$(cd "$(dirname "$0")" && pwd)"
REPO="$(cd "$DIR/../.." && pwd)"
LABEL="@@LABEL@@"
SCRIPT="$REPO/claudomate/scripts/heartbeat.sh"

if crontab -l 2>/dev/null | grep -q "$SCRIPT"; then
  echo "installed: $LABEL"
  echo "schedule: $(crontab -l 2>/dev/null | grep "$SCRIPT")"
else
  echo "not installed: $LABEL"
fi
