---
name: repo-hygiene
description: Maintain repository hygiene after each logical unit of work. Use when Codex should update TODO.md, CHANGELOG.md, or other project documentation, verify commit readiness, and leave the repository in a clean, understandable state after completing a meaningful change set.
metadata:
  short-description: Maintain repository hygiene
---

# Repo Hygiene

## Workflow

0. Ensure governance files exist
Create `AGENTS.md`, `CHANGELOG.md`, `TODO.md`, and `ROADMAP.md` at the repository root if they are missing. Treat their presence as a default hygiene requirement for repositories you maintain.

1. Update CHANGELOG.md
Add a new entry describing what changed and why, if that is not obvious. Keep entries concise and factual.
Sort changelog entries in reverse chronological order, with the most recent date section at the top and the newest items first within that section when practical.

2. Update TODO.md
Add next logical steps, keep items actionable and specific, and remove completed items only after they have been reflected in CHANGELOG.md.

3. Check related project documentation
Update affected project documentation when repository changes make it stale.

4. Prepare clean commit state
Ensure changes are grouped coherently and ready for a clean commit when the user wants to commit them.

5. Leave the repository understandable
Make sure the next logical steps, completed work, and current repo state are easy to understand for the next pass.

## Rules
Project documentation must be written in English by default.

This applies to files such as `README.md`, `MANUAL.md`, `TODO.md`, `CHANGELOG.md`, and documentation under `docs/`, unless the user explicitly requests another language.

Never leave `AGENTS.md`, `CHANGELOG.md`, `TODO.md`, or `ROADMAP.md` missing in a maintained repository. Create them before finishing substantial work if they do not exist.
Never leave TODO.md or CHANGELOG.md outdated.
When removing completed TODO items, first add the completed work to CHANGELOG.md in concise factual form.
Keep `CHANGELOG.md` ordered newest-first so recent work is immediately visible.
Do not use this skill to make high-level README structure decisions or decide whether a durable README split belongs in `README.md` versus `PROJECT_README.md`; use `readme-maintenance` or `skill-governance-review` for that.

Never commit unrelated changes together.

Prefer small, clean commits over large ones.

Do not assume code should be pushed or published unless the user asks for that or the workflow explicitly requires it.
