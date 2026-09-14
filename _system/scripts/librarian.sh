#!/bin/zsh
# Glens Brain — the librarian. Checked daily at 06:00 by launchd; actually runs
# only if Inbox/ has notes or the last run was 2+ days ago. `--force` runs now.
set -u
VAULT="/Users/glen/Documents/Claude Projects/Glens Brain"
LOCK="$VAULT/_system/log/.vault.lock"
LOG="$VAULT/_system/log/librarian.log"
STAMP="$VAULT/_system/log/.last-run"
MODEL="${LIBRARIAN_MODEL:-}"              # empty = Claude Code default model
MAX_SECONDS="${LIBRARIAN_TIMEOUT:-2400}"  # 40 min watchdog
export PATH="/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin"
cd "$VAULT" || exit 1
ts() { date "+%Y-%m-%d %H:%M:%S"; }

inbox_count=$(find Inbox -type f ! -name 'README.md' ! -name '.*' | wc -l | tr -d ' ')
days_since=99
[[ -f "$STAMP" ]] && days_since=$(( ( $(date +%s) - $(stat -f %m "$STAMP") ) / 86400 ))
if [[ "${1:-}" != "--force" && "$inbox_count" -eq 0 && "$days_since" -lt 2 ]]; then
  echo "$(ts) skipped: inbox empty, last run ${days_since}d ago" >> "$LOG"; exit 0
fi

# lock shared with sync.sh — wait up to 2 min for a sync in progress
for i in 1 2 3 4 5 6; do mkdir "$LOCK" 2>/dev/null && break; sleep 20; done
[[ -d "$LOCK" ]] || { echo "$(ts) could not get lock" >> "$LOG"; exit 1; }
trap 'rmdir "$LOCK" 2>/dev/null' EXIT

echo "$(ts) START inbox=$inbox_count days_since=$days_since" >> "$LOG"
git pull --rebase -q origin main >> "$LOG" 2>&1

PROMPT="You are the librarian for this Obsidian vault. Read CLAUDE.md, then _system/LIBRARIAN.md, then perform one full pass exactly as LIBRARIAN.md describes (steps 1-8), committing after each processed note and pushing at the end. Today is $(date +%Y-%m-%d). Work only inside this vault directory. When finished, reply with the contents of the run log you wrote, or 'no changes' if nothing needed doing."

# Headless Claude Code. Permission prompts can't be answered by launchd, so the
# run is unattended; the vault's CLAUDE.md hard rules are the guard-rails and
# git is the undo.
args=(-p "$PROMPT" --output-format text --permission-mode bypassPermissions)
[[ -n "$MODEL" ]] && args+=(--model "$MODEL")
( claude "${args[@]}" > "$VAULT/_system/log/.last-output.txt" 2>> "$LOG" ) &
pid=$!
( sleep "$MAX_SECONDS"; kill "$pid" 2>/dev/null && echo "$(ts) KILLED by watchdog after ${MAX_SECONDS}s" >> "$LOG" ) &
wd=$!
wait "$pid"; rc=$?
kill "$wd" 2>/dev/null
touch "$STAMP"

# belt and braces: commit anything the run left uncommitted, then push
git add -A; git diff --cached --quiet || git commit -q -m "librarian: post-run sweep $(ts)"
git push -q origin main >> "$LOG" 2>&1
echo "$(ts) END rc=$rc" >> "$LOG"
tail -c 600 "$VAULT/_system/log/.last-output.txt" >> "$LOG"; echo >> "$LOG"
