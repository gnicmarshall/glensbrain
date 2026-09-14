---
name: brain
description: Run the Glens Brain librarian pass now — file Inbox into Raw, update Wiki pages, link, lint, log, commit and push. Use when Glen says "/brain", "process my inbox", "tidy the vault" or "run the librarian".
---
Perform one librarian pass over this vault.

1. Read `CLAUDE.md` (vault root) and `_system/LIBRARIAN.md`. The hard rules there are binding.
2. Execute steps 1–8 of LIBRARIAN.md exactly: pull, inventory Inbox, process each note one at a time (move to Raw, resolve entities against titles AND aliases, write or merge Wiki pages, link both ways, commit per note), update hubs, lint, write the run log only if something changed, commit, push.
3. Report to Glen in plain English: what was filed where, which wiki pages were created or updated, any lint fixes, and anything under "Suggestions for Glen". Keep it under 200 words.

If `$ARGUMENTS` is non-empty, treat it as extra instruction for this run (e.g. "just the fitness stuff", "don't push").
