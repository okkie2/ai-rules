# DOALWAYS

## Purpose

This file collects standing rules that should always be followed in this repository.
It is for durable maintenance behavior, not for open work items.

## Standing Rules

- Keep `ai-rules` as the versioned source of truth for curated shared skills and shared governance notes.
- Edit shared skills and rules in the repository first, then commit and push before syncing live runtime changes.
- Use `zsh ~/Code/ai-rules/scripts/sync-to-codex.sh --dry-run` before any live runtime sync.
- Keep `~/.codex` as a runtime target, not the canonical source of truth.
- Keep runtime-managed content out of the curated repository unless it is intentionally vendored.
- Keep `MANUAL.md` current when the curated shared skill set or sync workflow changes materially.
- Keep `rules/skills-architecture.md` and `rules/skills-inventory.md` current when the curated skill system changes materially.
- Keep `README.md` short and orienting, not a dump of operational detail.
