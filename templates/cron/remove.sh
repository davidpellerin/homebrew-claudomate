#!/usr/bin/env bash
# Remove claudomate crontab entry for this repo.
DIR="$(cd "$(dirname "$0")" && pwd)"
REPO="$(cd "$DIR/../.." && pwd)"
LABEL="@@LABEL@@"
SCRIPT="$REPO/claudomate/scripts/heartbeat.sh"

( crontab -l 2>/dev/null | grep -v "claudomate:$LABEL" | grep -v "$SCRIPT" ) | crontab -
echo "removed cron job: $LABEL"
