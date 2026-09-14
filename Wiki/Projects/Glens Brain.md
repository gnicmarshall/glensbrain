---
type: project
title: Glens Brain
aliases: [This vault, Second brain, Obsidian vault, glensbrain]
created: 2026-09-13
updated: 2026-09-13
status: active
area: "[[AI & Tooling]]"
sources: []
tags: []
locked: false
---
# Glens Brain

**Goal:** A personal second brain in Obsidian where Glen only has to capture, and a Claude librarian does the filing, linking and upkeep.
**Status (2026-09-13):** Built today. Structure, rulebook, sync job and librarian job in place; first pass run over the notes migrated from the old Obsidiana vault.

## Key facts
- Folder: `Claude Projects/Glens Brain`. Repo: `gnicmarshall/glensbrain` (private). This is now the only Obsidian vault on the Mac.
- Flow: `Inbox/` → `Raw/` (immutable, dated) → `Wiki/` (Projects, Areas, Topics, People) → `Outputs/`. `Archive/` for finished things.
- Automation on the Mac: sync every 30 minutes; librarian checked daily at 06:00, runs only when Inbox has notes or 2+ days have passed. `/brain` runs it on demand.
- Pattern: Karpathy-style "LLM wiki" kept deliberately simple, with PARA-style Projects and Areas as the wiki's spine. See [[Agentic Knowledge Loops]].

## Decisions
- 2026-09-13 — Glens Brain replaces Obsidiana; the six old notes were migrated. Librarian cadence set to "every couple of days", not daily (Glen's call).

## Open questions
- Mobile capture: a Telegram "note" command in the assistant gateway that appends to Inbox. Agreed as the next step, not built yet.

## Links
- Rules: `CLAUDE.md` and `_system/LIBRARIAN.md` in the vault root
- [[Home]] hub

## Sources
- (none — this page documents the vault itself)
