---
type: topic
title: Agentic Knowledge Loops
aliases: [Agentic loops for knowledge, Agentic Loops for Knowledge Work, Loop engineering, Graph engineering, Goal command, Work graph]
created: 2026-09-13
updated: 2026-09-13
area: "[[AI & Tooling]]"
sources: ["[[2026-08-26 Agentic Loops for Knowledge Work transcript]]", "[[2026-09-13 Agentic loops for knowledge (Drive link)]]"]
tags: [training]
locked: false
---
# Agentic Knowledge Loops

Summary of the training webinar **"Agentic Loops for Knowledge Work"**: Nufar Gaspar with NLW (The AI Daily Brief × Superintelligent), recorded 26 Aug 2026, 74 minutes plus a self-paced lab. It covers how to get AI agents to keep working until a job is *actually* done (loops), and when to split work across a team of agents (graphs). Full text: [[2026-08-26 Agentic Loops for Knowledge Work transcript]].

## Links
- **Drive folder (all materials):** https://drive.google.com/drive/folders/15RgIk54wdnZw5FztAshxKsCzc9cDlsYn?usp=drive_link
- **Video (mp4, 808 MB):** https://drive.google.com/file/d/1rnTF734QW-7_4I3EX9oCYHmCeyJdUIST/view
- Audio only (m4a): https://drive.google.com/file/d/1t9hMkrJY6v7iu75g_5mz1A2PhRLFkvd8/view
- Transcript (.vtt): https://drive.google.com/file/d/10DVC_ypdKY7Kyz5hHu901pKFyp1n3LXv/view
- Slide screenshots: [the loop in plain words](https://drive.google.com/file/d/1b_M4fJWM7B7oH1KCVejDAUqqxiWA7msp/view) · [the loop inside your tools](https://drive.google.com/file/d/1RKg5oQxVJewPWd2ZRyXuKm_cvGKsNDlM/view)
- **Not in the folder:** the lab guide, the commands cheat-sheet and the token-efficiency playbook from the demo were shared in the Zoom chat, and the saved chat log is truncated.

## The 30-second version
1. Every agent tool already runs a loop under the hood: **plan → act → check → adjust**. It's generic, so it stops after "one polite pass". That's why you end up nudging it.
2. A **loop** (`/goal` in Claude Code, a loop command in Cursor) extends that cycle with *your* finish line: the agent keeps going round **until** a checkable condition is true.
3. The whole skill is **writing the finish line**. Coders get a free referee (the code compiles, the tests pass); knowledge workers have to build one. If you can't write a boring, checkable finish line, don't loop it.
4. A **graph** is several agents passing work between them (dots are agents, arrows are what flows). A loop is just the smallest graph: one node pointing back at itself.
5. Keep it simple: one prompt → one agent → a loop → a graph → a standing team. Move up a rung only when the rung below fails. Loops and graphs are the most token-hungry things you can run.

## Background: why everyone's talking about it
- The naming ladder: **prompt** engineering (what you say) → **context** (what it knows) → **harness** (where it runs, what tools it can touch) → **loop** (how long it runs alone) → **graph** (how many work together). Each rung gives AI more independence at a bigger scale.
- The buzzwords change every few months. The skill that survives is getting agents to work well and orchestrating them.
- NLW: OpenAI's usage data showed agentic use overtaking assisted chat (by tokens) around April–May 2026, and heavy agentic users are pulling away from everyone else.

## Loops
**A loop is not a schedule.** A schedule answers *when* (on a clock, or "when an email arrives"). A loop answers *until*. They make different promises.

**A task is worth looping when it's both:**
- **Long-running.** One prompt, even to the smartest model, didn't meet the bar.
- **Checkable.** You can tell whether it's done, or at least heading the right way.

Bonus signals: you'd like to walk away and come back to finished work, not a draft; it should run until a bar is met (or keep watching indefinitely); you want it to work harder than one pass (research is the classic case); the work improves draft by draft.

**Don't loop** when one pass does it, or when *your judgment is the work* (executive comms, hiring, strategy). "Autonomy has no taste." A normal chat is the smart move there, not a cop-out.

**Good use cases:** deep research, ad and campaign optimisation (click-through is measurable), competitive scans, content audits, compliance checks.

**Three requirements**
1. **A checkable finish line.** Boring is a compliment: "200 verified data points", "every competitor covered", "every claim cited", "summary under 150 words". Never "make it insightful".
2. **A bounded sandbox.** Somewhere mistakes are cheap (drafts, experiments), not live high-stakes systems.
3. **A task that converges.** Each round gets closer (more sources, fewer gaps). "Make it better" never converges.

**The goal card** is what you write after `/goal`:

| Part | Nufar's demo example |
|---|---|
| Objective | A definitive token-efficiency playbook, as of Aug 2026 |
| Output | A named file with an executive summary and the data |
| Done when | ≥200 unique data points, each with URL, date and type; at least 40 vendor docs, 40 practitioner sources and 20 benchmarks; zero duplicates |
| Stages (optional) | Gates to pass, or leave the agent to decide how |
| Fail-safes | Max 30 turns, sandbox only, a time cap |
| Log | Make it narrate each cycle ("cycle 2: 56/200") so you can watch progress |

In the demo it hit 56/200 in cycle 2 and overshot to 290 by cycle 3. Loops aren't always disciplined, which is why the cap matters.

**How loops fail, and the fix**
- **Runaway spend:** it just keeps going. Fix: a hard cap on turns or time.
- **Stuck:** it cycles without progress. Stop it, or tell it up front to "stop and report" if stuck.
- **Done but mediocre:** it met the letter of your finish line and the result is still bland. That's the goal card's fault, not the loop's; tighten the criteria.
- **It never should have been a loop:** the turn cap is your safety net.

## Graphs (teams of agents)
- **Nodes** are agents or tasks. **Edges** are the work or information flowing between them.
- **Two kinds:** a **work graph** is built for one job; an **org graph** is a standing team. Don't confuse either with a *knowledge graph* (which stores facts) or *LangGraph* (a developer framework).
- **Why now:** a node used to be one fragile LLM call. Now it's a whole agent, and a node can itself be a loop (a "heavy-duty node").
- An org chart shows who has authority, not how work actually flows. Draw the real flow.

**Move from one agent to a graph only when you see one of these:**
- **Rubber stamp.** It says "all checks out" and you keep finding misses. Models agree with themselves, so use a fresh-context verifier, ideally a different model.
- **Context overflow.** One agent is wearing too many hats (the researcher starts being "creative" too early).
- **Serial waiting.** Independent pieces could run in parallel.
- **The finish line keeps changing mid-run.** It's really two jobs on one card.
- **Quality flatlined** despite your best efforts.

If none of these apply, stay with one agent.

**Five ways to build a graph (easiest first; there's no need to reach the top)**
1. **Sketch it** on paper or a whiteboard. This forces you to confront what's undefined, and you can hand a photo of the sketch to an agent to build.
2. **Let the tool improvise.** It already spawns sub-agents on complex tasks.
3. **Prompt the graph in one sentence.** "Research these five competitors in parallel with separate sub-agents, then have a fresh-context reviewer check the merged results against this rubric" describes a 7-node graph.
4. **Persistent workers:** sub-agent files you summon (her examples were a benchmark collector, a citation verifier and a report visualiser), optionally wrapped in a skill that lists the phases.
5. **A canvas tool (n8n) or code (LangGraph).**

**Six habits of a good graph (as opposed to an expensive one)**
1. **Match the model to the node.** Cheap and fast for mechanical steps and yes/no verdicts; strong models where judgment is needed.
2. **Give each node only the context it needs.**
3. **Treat the edge as a contract.** Pass a draft plus a rubric, not the whole conversation.
4. **Spend where verification pays.** Fanning out costs tokens, so summarise between nodes and cap turns per node.
5. **Verify early.** Mistakes compound as they flow through a graph.
6. **Put a human at the right gate,** whether that's approving the plan or signing off the end.

One more warning: don't copy how humans hand work to each other today. That's shaped by human limits (attention, time, specialism) that agents don't share.

## Q&A nuggets
- **Security:** more autonomy means more risk. Loop in a sandbox, and prefer tightly scoped sub-agents over one god-like agent with access to everything.
- **Claude Code vs Cowork:** `/goal`-style commands live in the coding tools (Claude Code, Cursor, Codex). In Cowork you can get the same effect by prompting it to iterate.
- **Nervous about token costs:** learn on a cheaper model with a 5–10 turn cap, and pitch experiments to your manager as "tuition tokens".
- **Skill vs loop:** a loop runs *until* done; a skill is reusable. Once a loop works, wrap it in a skill that fires `/goal` with its specifics.
- **Tool commands change fast.** Check the current docs; some features exist only on some surfaces (for example, CLI but not desktop).
- **NLW's framing:** we're all "giving ourselves an MBA in agent management". There are no experts, only people who've done it more.

## Try it: the lab, in three layers
1. Design a goal card for a task from your own work (worth doing even with no tool that can run it).
2. Fire the loop for real.
3. Stretch: design a work graph for it.

## How this maps to Glen's setup
- This note was produced with `/goal` in Claude Code: a checkable finish line (filed, linked, summarised) with a 15-turn cap. That's exactly the goal-card shape the training teaches.
- Glen's `scout` / `executor` / `reviewer` subagents are "persistent workers" (tier 4), with a model matched to each role. `reviewer` is the fresh-context verifier that fixes the rubber-stamp problem.
- The [[Glens Brain]] librarian is a *schedule* (06:00 daily), not a loop: each run is one bounded pass. A loop version would be "keep going until the Inbox is empty and lint finds nothing, max N turns."

## Glen's view
- (nothing recorded yet)

## Related
- [[Glens Brain]]: the vault whose librarian agent turns Inbox notes into this wiki
- [[Agent Stack]]: an earlier product idea built on agents
- [[AI & Tooling]]

## Sources
- [[2026-08-26 Agentic Loops for Knowledge Work transcript]]: full transcript. It's a Zoom auto-transcript, so expect mis-hearings: "Gulf/Wolfe/wall graph" = graph/work graph, "Ograph" = org graph, "NA10" = n8n, "Oppos" = Opus, "Kelser/Kursor" = Cursor, "BOM engineering" = prompt engineering.
- [[2026-09-13 Agentic loops for knowledge (Drive link)]]: Glen's original capture of the folder link.
