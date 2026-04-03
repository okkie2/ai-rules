# AI Rules

This repository is the versioned source of truth for curated shared AI-agent guidance.

It currently holds:

- shared skills intended for Codex
- shared governance notes such as skills architecture and skills inventory

The live Codex runtime under `~/.codex/` remains untouched for now.
This repository is the safe first step toward managing shared skills from versioned source before introducing any sync or symlink workflow.

## Structure

- `skills/`: curated shared skills
- `rules/`: shared governance notes and inventories
- `scripts/`: sync helpers for live runtime deployment and recovery

## Current Status

This repository is an initial copy of the curated shared Codex skills and rules.
Future work may extend it to support other agent runtimes such as Claude from a common source.
