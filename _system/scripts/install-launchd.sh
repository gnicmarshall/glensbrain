#!/bin/zsh
# Installs (or reinstalls) the two launchd jobs for Glens Brain.
# Run once: zsh "_system/scripts/install-launchd.sh"
set -eu
SRC="/Users/glen/Documents/Claude Projects/Glens Brain/_system/launchd"
DST="$HOME/Library/LaunchAgents"
mkdir -p "$DST"
for job in com.glen.glensbrain.sync com.glen.glensbrain.librarian; do
  launchctl unload "$DST/$job.plist" 2>/dev/null || true
  cp "$SRC/$job.plist" "$DST/$job.plist"
  plutil -lint "$DST/$job.plist"
  launchctl load "$DST/$job.plist"
done
echo "Loaded:"; launchctl list | grep glensbrain
