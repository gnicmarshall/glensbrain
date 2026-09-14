---
type: raw
captured: 2026-04-19
source: Claude chat — first build plan for the Agent Stack product (migrated from Obsidiana vault)
processed: true
---

# Agent Stack — Build Blueprint v1

**The product, the workspace, the agents, the launch — everything in one doc.**

---

## PART 1: Product Foundation

### Name (working)
**Agent Stack** — The Credit-Smart Claude Agent Library for Notion

Alternative names if Agent Stack feels wrong once you've built it:
- Agent Ledger
- The Notion Agent Playbook
- Credit-Smart Agents

### Tagline
*15 pre-tuned Claude agents for Notion. Credit-tested. Production-ready. Built for the paid-credits era.*

### Price
- **Launch price:** $89 (first 30 days)
- **Standard price:** $129
- **Commercial license upsell:** +$40 (for agencies deploying to client workspaces)
- **Lifetime updates** included — this is non-negotiable given Notion's shipping pace

### Target buyer
AI-fluent professionals who already pay for Notion Business and Claude Pro: founders, AI enablement leads, solo consultants, marketers, AI engineers. They want a working system, not a blank canvas. They don't want tutorials — they want agents that run.

### Why they buy
Since May 4, 2026, every Notion agent run costs credits. Buyers suddenly need to know *which agents are worth running and how much they cost*. Agent Stack is the only library on the market that ships pre-measured credit costs per agent. That is the moat.

### One-line positioning
*"Every agent in this template has been benchmarked for credit cost on Opus 4.5. No guesswork. Plug it in and run."*

---

## PART 2: Workspace Architecture

This is what the buyer gets when they duplicate your template. Build this exact structure in Notion.

### Top-level page: `⚡ Agent Stack`

Under it:

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

The heart of the product. Every agent is a row.

| Property | Type | Notes |
|---|---|---|
| Name | Title | e.g. "Weekly Review Agent" |
| Vertical | Select | Founder, Marketer, AI Engineer, Researcher |
| Status | Select | Draft, Active, Archived |
| Trigger type | Select | Manual, Scheduled, Event-based |
| Credit cost per run | Number | From your benchmarking (e.g. 18) |
| Complexity | Select | Simple, Standard, Advanced |
| Model | Select | Opus 4.5, Sonnet 4.5, Haiku 4.5 |
| Connected databases | Relation | → your other databases |
| System instructions | Text | Full agent prompt |
| Example output | Files & media | Screenshot of a good run |
| Tags | Multi-select | daily, weekly, research, content, ops |

### Database 2: Agent Run Log

Tracks every time the buyer runs an agent. This justifies the credit spend.

| Property | Type |
|---|---|
| Run ID | Title (auto) |
| Agent | Relation → Agent Library |
| Date | Date |
| Credits used | Number |
| Output quality | Select (Great / OK / Poor) |
| Notes | Text |

### Database 3: Credit Tracker

A simple monthly rollup. The buyer sees how much they're spending and on what.

| Property | Type |
|---|---|
| Month | Title |
| Credits purchased | Number |
| Credits used | Rollup from Run Log |
| Credits remaining | Formula |
| Top agent by cost | Rollup |
| Cost in USD | Formula (×$0.01) |

### Database 4: Prompt Vault

Buyers' own prompts — not the agents themselves. Lets them collect reusable snippets.

| Property | Type |
|---|---|
| Prompt name | Title |
| Category | Select |
| Full prompt | Text |
| When to use | Text |
| Models tested | Multi-select |

---

## PART 3: The Agent Library (15 agents)

Four verticals. Ship all 15 in v1.

### 🏢 Founder / Operator (4 agents)
1. **Weekly Review Agent** — scans last 7 days of tasks + notes, produces structured review
2. **Morning Brief Agent** — pulls today's calendar + overdue tasks, writes prioritised plan
3. **Decision Log Agent** — structures gut decisions into "what / why / reversibility" entries
4. **Meeting Notes Structurer** — turns raw dumped notes into actions, decisions, open questions

### 📣 Marketer / Creator (4 agents)
5. **Competitor Intel Agent** — monitors a list of competitors, flags meaningful changes
6. **Content Idea Generator** — mines past notes for 10 fresh content angles per week
7. **Social Post Drafter** — expands one idea into LinkedIn / X / newsletter variants
8. **Campaign Retrospective Agent** — structures what worked / what didn't after a launch

### 🛠 AI Engineer / Builder (4 agents)
9. **Prompt Curator Agent** — tags and de-duplicates your Prompt Vault
10. **Model Comparator Agent** — runs same task on Opus/Sonnet/Haiku, compares outputs
11. **MCP Audit Agent** — lists your active connectors and flags stale ones
12. **Tool Discovery Scout** — surfaces new AI tools relevant to your workflows

### 📚 Researcher / Learner (3 agents)
13. **Reading Synthesiser** — extracts core arguments + counter-arguments from saved articles
14. **Research Question Expander** — breaks one big question into 8–12 testable sub-questions
15. **Knowledge Gap Finder** — compares your notes on a topic against what a reasonable expert would know

---

## PART 4: Five fully-written agent instructions (copy-paste ready)

Paste each of these into the "System instructions" field when creating the Custom Agent in Notion. These are tuned for Claude Opus 4.5.

### Agent 1 — Weekly Review Agent

```
You are a Weekly Review Agent. Your job is to help the user reflect on the last 7 days of work and prepare for the week ahead.

Every Sunday at 6pm (or when manually triggered), do the following:

1. Scan the user's Tasks database for entries completed in the last 7 days. List them grouped by project.
2. Scan for tasks overdue or still open. Flag anything older than 14 days as stale.
3. Scan the Decision Log for decisions made this week. Summarise each in one line.
4. Write three sections:
   - "Wins" — up to 5 bullet points, concrete accomplishments only
   - "Slipping" — anything overdue, stuck, or drifting
   - "Focus for next week" — 3 priorities, derived from what's open and important
5. Output as a new page in the Weekly Reviews database, titled "Week of [date]".

Tone: direct, no fluff, no praise for showing up. Treat the user as a capable adult who wants clarity, not cheerleading.

Never summarise content the user hasn't written. Never invent tasks. If a section is empty, say so.
```

### Agent 2 — Morning Brief Agent

```
You are a Morning Brief Agent. Run at 7am daily.

Steps:
1. Look at today's date. Pull all events from the connected calendar page or Meetings database.
2. Pull all tasks with due date = today, or marked "Today" in the Tasks database.
3. Pull all tasks marked "Overdue" or with a due date < today that are still open.
4. Produce a single brief structured as:
   - "Anchor meetings" — max 3 calendar events that matter, with times
   - "Must ship today" — 3 tasks maximum, chosen by priority + deadline
   - "Catching up" — up to 3 overdue items, ordered by how long they've been slipping
   - "One thing to skip" — identify one task or meeting that could be dropped or deferred
5. Output to the Daily Briefs page, dated today, no longer than 200 words.

Do not motivate. Do not moralise. Be ruthlessly pragmatic. If the user has 6 meetings today, say the brief is useless and suggest cancelling two.
```

### Agent 3 — Competitor Intel Agent

```
You are a Competitor Intel Agent. Run every Friday at 4pm.

Input: a Competitors database with a list of companies, each with a website URL and a "focus areas" field (e.g. pricing, product, hiring, content).

For each competitor:
1. Search the web for news, blog posts, and official announcements from the last 7 days.
2. Filter out anything not in their focus areas.
3. Extract meaningful changes only — ignore routine PR, awards, and generic thought leadership.
4. For each meaningful change, write one entry: "Company — what changed — why it matters (one sentence)".
5. If there are no meaningful changes, say so explicitly. Do not fabricate activity.

Output to the Competitor Intel page, dated this week. Max 15 bullets total across all competitors. If a competitor has had more than 3 meaningful moves in a week, add a flag: "⚠️ High activity — review separately."

Quality bar: a competitor launching a new product counts. A competitor's CEO posting on LinkedIn does not.
```

### Agent 4 — Prompt Curator Agent

```
You are a Prompt Curator Agent. Run on demand.

Input: the Prompt Vault database.

Do the following:
1. Read every prompt. Identify duplicates or near-duplicates. Merge them into one entry, preserving the clearest version.
2. Ensure every prompt has a "When to use" field. If missing, draft one from the prompt content.
3. Tag every prompt with 1–3 categories from this list: Research, Writing, Analysis, Coding, Communication, Decision, Learning, Admin.
4. Flag prompts that haven't been used in 90+ days with "Stale — consider archive".
5. At the end of the run, output a summary: "X prompts reviewed, Y merged, Z flagged stale".

Do not delete anything. Only mark and restructure.
```

### Agent 5 — Reading Synthesiser

```
You are a Reading Synthesiser Agent. Triggered when a new entry is added to the Reading List database with "Ready to process" selected.

For each article:
1. Read the saved content or fetch from the URL.
2. Identify the author's core argument in one sentence.
3. List the 3 strongest supporting points, each in one line.
4. List the 2 strongest counter-arguments the author did not address. If the user has notes on this topic already, cross-reference and note any contradictions.
5. Identify one "thing to try" — a concrete action the user could take based on this reading.
6. Output structured to the article's detail page.

Do not summarise plot or narrative. Focus on argument structure. If the article is opinion without argument, say so and stop.

Length: 250 words maximum total. This is a synthesis, not a summary.
```

### Template for writing the remaining 10

Use this skeleton for agents 6–15:

```
You are a [Role] Agent. [When it runs.]

Input: [which databases or sources it reads from]

Steps:
1. [Specific action]
2. [Specific action]
3. [Output location and format]

Quality bar: [what "good" looks like]

Constraints: [what it must NOT do — invent data, moralise, be verbose, etc.]

Output length: [word/bullet limit]
```

---

## PART 5: Credit Benchmarking Protocol

This is the anti-commodity moat. Nobody else does this. Do it properly.

### How to benchmark each agent

1. Build the agent.
2. Run it 5 times on representative inputs.
3. Note the credits used per run (Notion shows this in the agent run log).
4. Record the **median** (not average — averages get skewed by outlier runs).
5. Write a one-line "what affects the cost" note — e.g. "scales linearly with number of competitors tracked".

### What buyers see in the template

A read-only reference page titled "📖 Credit Benchmarks" with this table:

| Agent | Credits per run (median) | What drives cost | Monthly cost if run daily |
|---|---|---|---|
| Morning Brief | 8 | Task count | ~240 credits ($2.40) |
| Weekly Review | 22 | Task + decision volume | ~88 credits ($0.88) |
| Competitor Intel | 45 | Number of competitors | ~180 credits ($1.80) |
| Prompt Curator | 15 | Vault size | ~15 credits on demand |
| Reading Synthesiser | 12 per article | Article length | varies |
| … | … | … | … |

Fill the rest of the table as you build. **This table alone is worth the $89.**

---

## PART 6: Sales Page Copy (Gumroad + Notion Marketplace)

### Headline
**Agent Stack: 15 Credit-Smart Claude Agents for Notion**

### Subheadline
Skip the trial-and-error. Every agent is pre-tuned for Claude Opus 4.5 and benchmarked for credit cost. Deploy in one click.

### The problem (opening)
Notion agents moved to paid credits on May 4. Suddenly every run costs money. Nobody knows which agents are worth building, how to write good instructions, or what a "reasonable" credit budget looks like.

Most of what's online is guesswork.

### The product (what they get)
- A **ready-to-duplicate Notion workspace** with 4 databases wired together
- **15 Custom Agents** across Founder, Marketer, AI Engineer, and Researcher workflows — each with tested system instructions
- A **credit benchmark table** showing the actual cost of every agent on Opus 4.5
- A **Prompt Vault** to build your own library alongside the pre-built ones
- An **MCP & Skills setup guide** covering Slack, Linear, HubSpot, n8n
- **Lifetime updates** — Notion ships weekly, so this workspace keeps up

### Who it's for
- AI-enablement professionals at companies rolling out Notion AI
- Founders who want an operating system that runs itself
- Marketers who don't want to babysit workflows
- AI engineers who want a template to fork, not a course to sit through

### Who it's not for
- People who want a Second Brain — buy Easlo or Thomas Frank instead
- People who haven't upgraded to Notion Business with AI enabled
- People looking for "10,000 ChatGPT prompts" — different product entirely

### Objection handlers
- *"Can't I build this myself?"* — Yes, in about 40 hours. This saves you 38 of them.
- *"How do I know the credit numbers are real?"* — Every number is from a real run. Buy it, run the agent, get within ±15% of the published cost or get a refund.
- *"Will this work on Notion Plus?"* — No. You need Notion Business + AI. That's a Notion constraint, not mine.

---

## PART 7: Launch Checklist

Work through this in order. Tick as you go.

**Pre-build (this week)**
- [ ] Upgrade Notion to Plus, then Business, and enable Notion AI
- [ ] Register a domain (optional): `agentstack.so`, `notionagents.co`, `agentstack.io`
- [ ] Create a Gumroad account
- [ ] Create an anonymous X account for build-in-public (no face, no name needed)

**Build phase (weeks 2–6)**
- [ ] Create top-level `Agent Stack` page
- [ ] Build the 4 databases with the exact schemas above
- [ ] Write and test agents 1–5 (use the instructions above)
- [ ] Write and test agents 6–15 (using the template)
- [ ] Benchmark every agent — 5 runs each, median credits recorded
- [ ] Fill in the Credit Benchmarks reference table
- [ ] Record 3 screen videos showing 3 agents in action (faceless, just the screen)

**Package phase (week 7)**
- [ ] Design cover image in Canva — dark theme, minimal, just the name + "15 Agents"
- [ ] Write the Gumroad description (use Part 6)
- [ ] Set up Gumroad product at $89 with a launch discount code
- [ ] Take 6–8 screenshots of the workspace for the listing
- [ ] Record a 60-second loom-style demo
- [ ] Set up a duplicate-link for the template (Notion share → publish → make template)

**Launch phase (week 8)**
- [ ] Submit to Notion Marketplace (notion.com/templates/submit)
- [ ] Publish on Gumroad
- [ ] Post a launch thread on X, one tweet per agent (15 tweets, scheduled)
- [ ] Cross-post on Prototion and NotionEverything
- [ ] Email any existing network (personal, not eBay)
- [ ] Set up affiliate program at 40% on Gumroad

**Post-launch (ongoing, minimal effort)**
- [ ] One free agent per week on X as a lead magnet
- [ ] Reply to Gumroad reviews within 7 days
- [ ] Ship one new agent per month as a free update
- [ ] Review competitor landscape quarterly

---

## Your immediate next action

1. **Upgrade Notion today.** Plus + AI is $20/mo. Without this, nothing works.
2. **Reply "Upgraded, what next"** and I'll walk you through creating the first database and setting up Agent 1 — the Weekly Review Agent — step by step.

That's the whole plan. Let's build it.
