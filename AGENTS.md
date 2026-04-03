# AGENTS.md

## Scope

This file applies to the whole repository.

## Operating Model

This repository is the versioned source of truth for curated shared AI-agent skills and governance notes.
Keep runtime-specific caches, plugin content, and generated system-managed artifacts out of scope unless explicitly vendored on purpose.

## Repository Context

- `skills/`: curated shared skills
- `rules/`: architecture notes, inventories, and other shared governance documents
- live runtime remains outside this repo for now under `~/.codex/`

## Repository-Specific Rules

- Keep this repo focused on curated shared skills and rules, not runtime caches.
- Treat changes here as source-of-truth changes rather than ad hoc local runtime edits.
- Keep skills architecture and skills inventory current when the shared skill system changes materially.
- When copying changes from runtime into this repo, prefer clean logical commits rather than bulk dumps.

## Local Exceptions

- None yet.
