#!/bin/zsh
# Glens Brain — commit & push the vault. Run by launchd every 30 min.
# Safe to run any time: no-op if nothing changed; skips if the librarian holds the lock.
set -u
VAULT="/Users/glen/Documents/Claude Projects/Glens Brain"
LOCK="$VAULT/_system/log/.vault.lock"
LOG="$VAULT/_system/log/sync.log"
export PATH="/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin"
cd "$VAULT" || exit 1
ts() { date "+%Y-%m-%d %H:%M:%S"; }
# lock (mkdir is atomic on macOS); treated as stale after 3 h
if ! mkdir "$LOCK" 2>/dev/null; then
  if [[ -n "$(find "$LOCK" -maxdepth 0 -mmin +180 2>/dev/null)" ]]; then
    rmdir "$LOCK"; mkdir "$LOCK" || exit 0
  else
    echo "$(ts) skipped: lock held" >> "$LOG"; exit 0
  fi
fi
trap 'rmdir "$LOCK" 2>/dev/null' EXIT
git add -A
if ! git diff --cached --quiet; then
  git commit -q -m "vault sync $(ts)" && echo "$(ts) committed" >> "$LOG"
fi
if git pull --rebase -q origin main >> "$LOG" 2>&1; then
  if [[ -n "$(git log origin/main..HEAD --oneline 2>/dev/null)" ]]; then
    git push -q origin main >> "$LOG" 2>&1 && echo "$(ts) pushed" >> "$LOG"
  fi
else
  echo "$(ts) PULL FAILED — resolve manually (git status)" >> "$LOG"
  git rebase --abort 2>/dev/null
fi
