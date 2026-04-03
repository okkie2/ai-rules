# Skills Architecture

## Purpose

This note describes how the global Codex skill system is organized and how to decide what belongs in shared rules, shared skills, or repo-local `AGENTS.md` guidance.

The goal is to keep the system reusable, understandable, and resistant to drift.

## Design Principle

Use the global skill system for reusable behavior and repeatable execution patterns.
Use repo-local `AGENTS.md` for project-specific defaults, domain constraints, source-specific modelling rules, and temporary local exceptions.

## Top-Level Taxonomy

### `core`

Universal behavior and discipline that should hold across many projects.

Examples:

- quality and safety defaults
- commit discipline
- review discipline
- observability defaults
- repo hygiene

### `decision-rules`

Rules that govern how Codex decides what kind of work it is doing and how to approach it.

Examples:

- model routing rules
- escalation rules
- modelling-choice rules such as field vs relation vs label vs child statement

### `workflows`

Repeatable multi-step ways of working.

Examples:

- delivery routine
- issue-first delivery
- regression workflows
- PR review handling

### `contexts`

Reusable patterns for a kind of project or execution context, whether coding or non-coding.

Examples:

- Python web app
- Flask/SQLite app
- longform writing project
- policy memo project
- research synthesis project
- slides/briefing workflow

A context is broader than a single repo, but narrower than a universal rule.

### `platforms`

Rules and workflows specific to external systems and connected tooling.

Examples:

- GitHub
- Google Drive
- deployment platforms
- issue trackers

## Stable Rules vs Temporary Exceptions

Both the global system and individual repositories can have:

- stable active rules
- temporary exceptions or transition choices

Keep those separate where possible.
Do not let temporary exceptions silently harden into undocumented defaults.

## Placement Rule

Use this decision rule:

- reusable across multiple repos or projects -> global rule or global skill
- reusable only within one type of project -> context skill
- specific to one repository, source set, or domain model -> local `AGENTS.md`
- temporary migration or local transition choice -> local repo governance unless it is clearly a broader temporary global exception

## Practical Heuristics

Something is a good shared skill when:

- it recurs across multiple repos or sessions
- it is specific enough to change outcomes
- it would otherwise keep being re-explained
- it is not better expressed as a short repo-local rule

Something should stay local when:

- it depends on one repo's commands, schema, or directory layout
- it encodes one project's domain language or source corpus
- it is a temporary local modelling compromise

## Current Direction

The preferred global architecture is:

- `core`
- `decision-rules`
- `workflows`
- `contexts`
- `platforms`

This structure is intentionally broad enough to support:

- coding projects
- writing projects
- research projects
- document-heavy projects
- mixed projects

## Maintenance Rule

When a repo keeps repeating the same local rule, check whether it should be promoted into the global skill system.
When a shared skill starts carrying too many repo-specific assumptions, push those assumptions back down into `AGENTS.md`.
