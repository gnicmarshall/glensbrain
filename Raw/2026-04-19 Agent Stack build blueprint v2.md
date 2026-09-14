---
type: raw
captured: 2026-04-19
source: Claude chat — revised build plan for the Agent Stack product, supersedes v1 (migrated from Obsidiana vault)
processed: true
---

# Agent Stack — Build Blueprint v2
*Updated: April 19, 2026*

---

## PART 1: Product Foundation

### Name
**Agent Stack** — The Credit-Smart Claude Agent Library for Notion

### Tagline
*15 pre-tuned Claude agents for Notion. Credit-tested. Production-ready. Built for the paid-credits era.*

### Price
- **Launch price:** $89 (first 30 days)
- **Standard price:** $129
- **Commercial license upsell:** +$40
- **Lifetime updates** included

### Target buyer
AI-fluent professionals on Notion Business with Claude: founders, AI enablement leads, solo consultants, marketers, AI engineers. They want a working system, not a blank canvas.

### One-line positioning
*"Every agent in this template has been benchmarked for credit cost on Claude Opus. No guesswork. Plug it in and run."*

---

## PART 2: Model Selection Logic

Use this to decide which model to assign to each agent:

| Model | When to use | Credit cost |
|---|---|---|
| **Claude Opus** | Complex, multi-step, reasoning heavy — e.g. Weekly Review scanning multiple databases | Highest |
| **Claude Sonnet** | Moderate tasks, content drafting, summarising single sources | Medium |
| **Claude Haiku** | Simple, repetitive, single-field tasks — e.g. tagging, categorising | Lowest |

**Rule of thumb:** Don't use Opus when Haiku will do. This guidance alone is worth documenting in the product — buyers don't know this.

---

## PART 3: Workspace Architecture

### Top-level structure
```
⚡ Agent Stack
├── 🚀 Start Here
├── 🤖 Agent Library (database)
├── 📊 Agent Run Log (database)
├── 💳 Credit Tracker (database)
├── 🧠 Prompt Vault (database)
├── 🔌 MCP & Skills Setup
└── 📖 Credit Benchmarks (read-only reference)
```

### Database 1: Agent Library

| Property | Type | Options |
|---|---|---|
| Name | Title | — |
| Vertical | Select | 🏢 I run things (purple), 📣 I make content (pink), 🛠 I build with AI (blue), 📚 I learn things (yellow) |
| Status | Select | Draft (gray), Active (green), Archived (brown) |
| Trigger type | Select | Manual (gray), Scheduled (blue), Event-based (orange) |
| Credit cost per run | Number | Fill after benchmarking |
| Complexity | Select | Simple (green), Standard (yellow), Advanced (red) |
| Model | Select | Claude Opus (purple), Claude Sonnet (blue), Claude Haiku (green) |
| System instructions | Text | Full agent prompt |
| Tags | Multi-select | daily, weekly, research, content, ops |

### Database 2: Agent Run Log

| Property | Type |
|---|---|
| Run ID | Title |
| Agent | Relation → Agent Library |
| Date | Date |
| Credits used | Number |
| Output quality | Select: Great / OK / Poor |
| Notes | Text |

### Database 3: Credit Tracker

| Property | Type |
|---|---|
| Month | Title |
| Credits purchased | Number |
| Credits used | Rollup from Run Log |
| Credits remaining | Formula |
| Cost in USD | Formula (×$0.01) |

### Database 4: Prompt Vault

| Property | Type |
|---|---|
| Prompt name | Title |
| Category | Select |
| Full prompt | Text |
| When to use | Text |
| Models tested | Multi-select |

---

## PART 4: The 15 Agents

### 🏢 I run things — Founder / Operator (4 agents)
1. **Weekly Review Agent** — scans last 7 days of tasks + notes, produces structured review
2. **Morning Brief Agent** — pulls today's tasks + overdue items, writes prioritised plan
3. **Decision Log Agent** — structures decisions into "what / why / reversibility" entries
4. **Meeting Notes Structurer** — turns raw notes into actions, decisions, open questions

### 📣 I make content — Marketer / Creator (4 agents)
5. **Competitor Intel Agent** — monitors competitors, flags meaningful changes
6. **Content Idea Generator** — mines past notes for 10 fresh content angles per week
7. **Social Post Drafter** — expands one idea into LinkedIn / X / newsletter variants
8. **Campaign Retrospective Agent** — structures what worked / didn't after a launch

### 🛠 I build with AI — AI Engineer / Builder (4 agents)
9. **Prompt Curator Agent** — tags and de-duplicates your Prompt Vault
10. **Model Comparator Agent** — runs same task on Opus/Sonnet/Haiku, compares outputs
11. **MCP Audit Agent** — lists active connectors, flags stale ones
12. **Tool Discovery Scout** — surfaces new AI tools relevant to your workflows

### 📚 I learn things — Researcher / Learner (3 agents)
13. **Reading Synthesiser** — extracts core arguments from saved articles
14. **Research Question Expander** — breaks one big question into 8–12 sub-questions
15. **Knowledge Gap Finder** — identifies what's missing in your notes on a topic

---

## PART 5: Agent Instructions (copy-paste ready)

### Agent 1 — Weekly Review Agent
**Model:** Claude Opus | **Trigger:** Scheduled (Sunday 6pm or Monday 7am — your choice) | **Complexity:** Standard

```
You are a Weekly Review Agent. Your job is to help the user reflect on the last 7 days of work and prepare for the week ahead.

Every Sunday at 6pm (or when manually triggered), do the following:

1. Scan the Tasks database for entries completed in the last 7 days. List them grouped by project.
2. Scan for tasks overdue or still open. Flag anything older than 14 days as stale.
3. Write three sections:
   - "Wins" — up to 5 bullet points, concrete accomplishments only
   - "Slipping" — anything overdue or stuck
   - "Focus for next week" — 3 priorities derived from what's open
4. Output as a new page titled "Week of [date]"

Tone: direct, no fluff. Treat the user as a capable adult who wants clarity, not cheerleading. Never invent tasks.
```

### Agent 2 — Morning Brief Agent
**Model:** Claude Sonnet | **Trigger:** Scheduled (daily 7am) | **Complexity:** Simple

```
You are a Morning Brief Agent. Run at 7am daily.

1. Pull all events from the Meetings database dated today.
2. Pull all tasks with due date = today, or marked "Today".
3. Pull all tasks marked overdue.
4. Produce a brief structured as:
   - "Anchor meetings" — max 3 events that matter, with times
   - "Must ship today" — 3 tasks maximum, by priority + deadline
   - "Catching up" — up to 3 overdue items, oldest first
   - "One thing to skip" — one task or meeting to defer
5. Output to Daily Briefs page, dated today. Max 200 words.

Do not motivate. Do not moralise. Be ruthlessly pragmatic. If the user has 6 meetings, say the brief is useless and suggest cancelling two.
```

### Agent 3 — Competitor Intel Agent
**Model:** Claude Opus | **Trigger:** Scheduled (Friday 4pm) | **Complexity:** Advanced

```
You are a Competitor Intel Agent. Run every Friday at 4pm.

Input: a Competitors database with company names, URLs, and focus areas.

For each competitor:
1. Search the web for news and announcements from the last 7 days.
2. Filter to focus areas only. Ignore routine PR and generic thought leadership.
3. For each meaningful change: "Company — what changed — why it matters (one sentence)".
4. If no meaningful changes, say so. Do not fabricate activity.

Output to Competitor Intel page, dated this week. Max 15 bullets total.
Flag: "⚠️ High activity — review separately" if a competitor has 3+ moves in a week.

Quality bar: product launch = yes. CEO LinkedIn post = no.
```

### Agent 4 — Prompt Curator Agent
**Model:** Claude Haiku | **Trigger:** Manual | **Complexity:** Simple

```
You are a Prompt Curator Agent. Run on demand.

Input: the Prompt Vault database.

1. Identify duplicates or near-duplicates. Merge into one entry, keeping the clearest version.
2. Ensure every prompt has a "When to use" field. Draft one if missing.
3. Tag every prompt with 1–3 categories: Research, Writing, Analysis, Coding, Communication, Decision, Learning, Admin.
4. Flag prompts unused in 90+ days with "Stale — consider archive".
5. Output summary: "X prompts reviewed, Y merged, Z flagged stale".

Do not delete anything. Only mark and restructure.
```

### Agent 5 — Reading Synthesiser
**Model:** Claude Sonnet | **Trigger:** Event-based (new entry in Reading List) | **Complexity:** Standard

```
You are a Reading Synthesiser Agent. Triggered when a new entry is added to the Reading List database with "Ready to process" selected.

For each article:
1. Read the saved content or fetch from URL.
2. State the author's core argument in one sentence.
3. List the 3 strongest supporting points, one line each.
4. List the 2 strongest counter-arguments the author didn't address.
5. Identify one "thing to try" — a concrete action based on this reading.
6. Output structured to the article's detail page.

Do not summarise plot or narrative. Focus on argument structure. If the article is opinion without argument, say so and stop.
Max 250 words total.
```

### Template for agents 6–15

```
You are a [Role] Agent. [When it runs.]

Input: [which databases or sources it reads]

Steps:
1. [Specific action]
2. [Specific action]
3. [Output location and format]

Quality bar: [what "good" looks like]
Constraints: [what it must NOT do]
Output length: [word/bullet limit]
```

---

## PART 6: Credit Benchmarking Protocol

Run each agent 5 times on real inputs. Record the median credit cost. This is the anti-commodity moat — no other template does this.

### Credit Benchmarks reference table (fill as you build)

| Agent | Credits per run (median) | What drives cost | Monthly cost if run on schedule |
|---|---|---|---|
| Morning Brief | ~8 | Task count | ~240 credits ($2.40) |
| Weekly Review | ~22 | Task + decision volume | ~88 credits ($0.88) |
| Competitor Intel | ~45 | Number of competitors | ~180 credits ($1.80) |
| Prompt Curator | ~15 | Vault size | on demand |
| Reading Synthesiser | ~12 per article | Article length | varies |
| Content Idea Generator | TBC | Note volume | TBC |
| Social Post Drafter | TBC | — | TBC |
| Decision Log | TBC | — | TBC |
| Meeting Notes | TBC | — | TBC |
| Campaign Retro | TBC | — | TBC |
| Model Comparator | TBC | — | TBC |
| MCP Audit | TBC | — | TBC |
| Tool Discovery | TBC | — | TBC |
| Research Expander | TBC | — | TBC |
| Knowledge Gap | TBC | — | TBC |

---

## PART 7: Sales Page Copy

### Headline
**Agent Stack: 15 Credit-Smart Claude Agents for Notion**

### Subheadline
Skip the trial-and-error. Every agent is pre-tuned for Claude and benchmarked for credit cost. Deploy in one click.

### The problem
Notion agents moved to paid credits on May 4. Suddenly every run costs money. Nobody knows which agents are worth building, how to write good instructions, or what a reasonable credit budget looks like.

### What they get
- A ready-to-duplicate Notion workspace with 4 databases wired together
- 15 Custom Agents across 4 verticals — each with tested instructions
- A credit benchmark table showing the actual cost of every agent
- A Prompt Vault to build your own library alongside the pre-built ones
- An MCP & Skills setup guide covering Slack, Linear, HubSpot, n8n
- Lifetime updates

### Who it's for
- AI enablement professionals rolling out Notion AI
- Founders who want an operating system that runs itself
- Marketers who don't want to babysit workflows
- AI engineers who want a template to fork, not a course to sit through

### Who it's not for
- People who want a Second Brain — buy Easlo or Thomas Frank instead
- People who haven't upgraded to Notion Business with AI enabled
- People looking for generic prompt packs

### Objection handlers
- *"Can't I build this myself?"* — Yes, in about 40 hours. This saves you 38 of them.
- *"How do I know the credit numbers are real?"* — Every number is from a real run. Get within ±15% or get a refund.
- *"Will this work on Notion Plus?"* — No. Notion Business + AI required. That's a Notion constraint, not mine.

---

## PART 8: Launch Checklist

### Pre-build
- [x] Upgrade Notion to Business + AI
- [ ] Register domain: agentstack.so or similar
- [ ] Create Gumroad account
- [ ] Create anonymous X account for build-in-public

### Build (Days 1–5)
- [x] Create Agent Stack top-level page
- [x] Build Agent Library database with all properties
- [x] Add Weekly Review Agent row
- [x] Create first Custom Agent in Notion
- [ ] Rename agent from "Vibrant Astronomer" to "Weekly Review Agent"
- [ ] Set trigger for Weekly Review Agent
- [ ] Set model to Claude Opus
- [ ] Save and publish
- [ ] Build Agent Run Log database
- [ ] Build Credit Tracker database
- [ ] Build Prompt Vault database
- [ ] Build agents 2–5 with full instructions
- [ ] Build agents 6–15 using template
- [ ] Benchmark credit costs — 5 runs each
- [ ] Fill credit benchmark table

### Package (Day 6)
- [ ] Design cover image in Canva — dark theme, minimal
- [ ] Write Gumroad description (use Part 7)
- [ ] Set price at $89 with launch code
- [ ] Take 6–8 screenshots of the workspace
- [ ] Record 60-second screen demo (faceless)
- [ ] Create Notion duplicate link

### Launch (Day 7)
- [ ] Submit to Notion Marketplace
- [ ] Publish on Gumroad
- [ ] Post launch thread on X
- [ ] Cross-post on Prototion and NotionEverything
- [ ] Set up 40% affiliate program on Gumroad

---

## PART 9: Build Log

### Day 1 — April 19, 2026
- ✅ Notion upgraded to Business (£23.40/month)
- ✅ Agent Library database built with all 8 properties
- ✅ Vertical options: 🏢 I run things, 📣 I make content, 🛠 I build with AI, 📚 I learn things
- ✅ Colour coding applied to all Select properties
- ✅ Weekly Review Agent row added
- ✅ First Custom Agent created (pending rename + trigger setup)
