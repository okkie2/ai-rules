---
name: ai-rules-sync
description: Sync curated shared skills and rules between the ai-rules source repository and the live Codex runtime safely. Use when shared skills or rules have changed in the repo and need to be deployed to ~/.codex, or when accidental live runtime edits must be pulled back into the repo for recovery.
metadata:
  short-description: Sync ai-rules with live Codex runtime
---

# AI Rules Sync

Use this skill when shared skills or rules need to move between the `ai-rules` source repository and the live Codex runtime.

Before deciding that a request belongs here, follow `/Users/joostokkinga/Code/ai-rules/rules/skills-architecture.md`: this is a shared `workflows` skill because it defines an operational sync routine rather than a repository-specific exception.

## Source Of Truth

Default source of truth:

- repo: `~/Code/ai-rules`

Live runtime:

- Codex runtime: `~/.codex`

Default direction:

- repo -> runtime

Use runtime -> repo only for recovery or bootstrap after accidental live edits.

## Scripts

Use these scripts from the repo:

- `scripts/sync-to-codex.sh`
- `scripts/sync-from-codex.sh`

## Core Rules

- Treat `~/Code/ai-rules` as canonical.
- Prefer syncing from repo to runtime.
- Do not treat `~/.codex` as the long-term source of truth.
- Do not touch runtime-managed `.system` skills through this workflow.
- Do not touch plugin caches through this workflow.
- Use dry runs first when the change set is non-trivial or when the sync path is newly changed.
- Commit repo changes before deploying them to runtime when practical.

## Default Workflow

1. Make or review the change in `~/Code/ai-rules`.
2. Commit the change in the repo when it is a logical unit of work.
3. Run `scripts/sync-to-codex.sh --dry-run`.
4. If the preview looks correct, run `scripts/sync-to-codex.sh`.
5. Verify the live runtime behavior.
6. If a live edit was made by accident, use `scripts/sync-from-codex.sh --dry-run` first, then recover deliberately.

## When To Use Reverse Sync

Use `sync-from-codex.sh` only when:

- a shared skill was edited live in `~/.codex` by mistake
- you are bootstrapping from runtime content that is not yet in the repo
- you need to recover runtime changes before cleaning up the source repo

Do not use reverse sync as the normal workflow.

## Guard Rails

- Never delete or overwrite `.system` runtime skills as part of this sync workflow.
- Never sync plugin-provided skills into the curated source repo unless you are explicitly vendoring them.
- Never assume runtime edits are canonical just because they are newer.
- Do not skip verification after syncing behavior-changing skills.

## Output Expectations

When this skill is used, Codex should:

- state the intended sync direction first
- recommend dry-run first when appropriate
- name the exact script to run
- warn when the user is drifting toward runtime-first editing
- keep `.system` and plugin caches out of scope
