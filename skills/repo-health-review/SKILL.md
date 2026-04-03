---
name: repo-health-review
description: Run lightweight or broad repository-health reviews after meaningful feature waves to catch drift in planning, documentation, QA, architecture, deployment assumptions, and other cross-cutting repository concerns. Use when a meaningful feature wave lands, a user-visible workflow changes, a new architectural seam appears, or a durable document or governance pattern has shifted.
metadata:
  short-description: Review repo health after feature waves
---

# Repo Health Review

Use this skill when a meaningful feature wave has landed and the repository may need a coherence check beyond the immediate code change.

Before deciding that a request belongs here, follow `/Users/joostokkinga/.codex/rules/skills-architecture.md`: this is a shared `workflows` skill because it defines a reusable review routine rather than one repository's local exception.

## Objective

Keep repositories coherent as they grow by reviewing the health of:

- planning
- documentation
- quality assurance
- architecture
- deployment and operational assumptions
- terminology and design-system drift when relevant

Review by feature wave, not by line count.

## Triggers

Use this skill whenever:

- a meaningful feature wave has landed
- a user-visible workflow changed
- a new architectural seam was introduced
- a new authoritative document was created or promoted
- a technical-debt hotspot noticeably grew

## Review Cadence

Run one of two review depths.

### Small Review

Run after every 1 meaningful feature wave.

A meaningful feature wave is usually one of:

- a new capability
- a changed user workflow
- a meaningful UI-mode or interaction change
- a new export or import path
- a new architectural boundary or module
- a new authoritative repository document

### Broad Review

Run after every 2 to 4 meaningful feature waves.

Use the broad review to step back and assess the repository as a whole, not just the changed feature.

## What A Small Review Checks

Check whether the recent wave caused drift in:

- `TODO.md`
- `ROADMAP.md`
- `README.md` and the repository doc index
- the most relevant authoritative docs for the changed area
- QA adequacy for the new behavior
- architecture coherence in the touched area
- deployment and operations assumptions if runtime or hosting behavior changed

Small review questions:

- Are the right items still in `TODO.md` versus `ROADMAP.md`?
- Did any authoritative docs become stale?
- Is regression coverage good enough for what changed?
- Did this feature increase technical debt in a way we should now document or plan around?

## What A Broad Review Checks

A broad review includes everything in the small review, plus:

- overall repo hygiene and generated-artifact boundaries
- glossary and ubiquitous-language drift
- design-system drift when relevant
- documentation layering drift
- QA posture versus current product ambition
- deployment and source-of-truth clarity
- whether large TODO items actually belong on the roadmap

Broad review questions:

- Is the repository still telling one coherent story?
- Are model, UI, exports, QA, and deployment still maturing at a balanced pace?
- Is any major area now under-documented or over-complicated?

## Where To Record Outcomes

Use:

- `TODO.md` for concrete next actions
- `ROADMAP.md` for larger directional shifts
- `CHANGELOG.md` for completed meaningful changes
- `AGENTS.md` if the review reveals a durable repository operating rule
- the relevant authoritative doc if the review shows current-state drift

Do not leave important review conclusions only in chat.

## Guard Rails

Do not:

- trigger reviews mechanically by raw LOC count
- turn every small feature into a giant governance exercise
- move implementation-ready tasks to the roadmap just because they are important
- leave repeated review findings undocumented across multiple waves

Do:

- review by change shape and risk
- keep small reviews short and practical
- use broad reviews to rebalance the repository when needed
- update the repo's authoritative documents when a durable pattern changes
