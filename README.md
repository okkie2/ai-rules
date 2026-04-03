# AI Rules

This repository is the versioned source of truth for curated shared AI-agent guidance.

It currently holds:

- shared skills intended for Codex
- shared governance notes such as skills architecture and skills inventory
- a practical manual for setup, syncing, and skill overview

The live Codex runtime under `~/.codex/` remains untouched for now.
This repository is the safe first step toward managing shared skills from versioned source before introducing any sync or symlink workflow.

## Structure

- `skills/`: curated shared skills
- `rules/`: shared governance notes and inventories
- `scripts/`: sync helpers for live runtime deployment and recovery
- `notes/`: human-readable worklogs and other narrative notes about repository work
- `MANUAL.md`: setup guide and overview of the curated shared skills

## Main Documents

- `README.md`: short repo entrypoint and document index
- `MANUAL.md`: practical setup, sync, and usage guide
- `DOALWAYS.md`: standing rules that should always be followed in this repository
- `TODO.md`: current open actions and unresolved next steps
- `ROADMAP.md`: larger future directions and structural follow-on work
- `CHANGELOG.md`: compact factual record of meaningful completed changes
- `rules/skills-architecture.md`: governing structure for the shared skill system
- `rules/skills-inventory.md`: maintained inventory of current shared, runtime, and plugin skill surfaces

## Read First

- [MANUAL.md](MANUAL.md): how to set up the repo, how syncing works, and what each curated shared skill is for
- [DOALWAYS.md](DOALWAYS.md): standing rules that always apply in this repository
- [notes/2026-04-03-worklog.md](notes/2026-04-03-worklog.md): human-readable worklog for today's skills and governance work
- [rules/skills-architecture.md](rules/skills-architecture.md): how the shared skill system is structured
- [rules/skills-inventory.md](rules/skills-inventory.md): maintained inventory of the current skill set

## Current Status

This repository is an initial copy of the curated shared Codex skills and rules.
Future work may extend it to support other agent runtimes such as Claude from a common source.
