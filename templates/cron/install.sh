#!/usr/bin/env bash
# Install claudomate crontab entry for this repo.
DIR="$(cd "$(dirname "$0")" && pwd)"
REPO="$(cd "$DIR/../.." && pwd)"
LABEL="@@LABEL@@"
SCRIPT="$REPO/claudomate/scripts/heartbeat.sh"
LOG="$REPO/logs/heartbeat.log"
ERR="$REPO/logs/heartbeat_errors.log"
ENTRY="*/15 * * * * $SCRIPT >> $LOG 2>> $ERR"
MARKER="# claudomate:$LABEL"

# Remove any existing entry for this repo, then add fresh
( crontab -l 2>/dev/null | grep -v "claudomate:$LABEL" | grep -v "$SCRIPT" ) | crontab -
( crontab -l 2>/dev/null; echo "$MARKER"; echo "$ENTRY" ) | crontab -
echo "installed cron job: $LABEL"
