---
name: repo-hygiene
description: Maintain repository hygiene after each logical unit of work. Use when Codex should update TODO.md, CHANGELOG.md, or other project documentation, verify commit readiness, and leave the repository in a clean, understandable state after completing a meaningful change set.
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

Ensure `README.md` includes an index and short explainer for the other repository documentation files, and update that index whenever the documentation set changes.

When a repository contains both reusable tool code and project-specific or client-specific content, explicitly evaluate whether the README structure should be split into:
- `README.md` for the tool or reusable repository entrypoint
- `PROJECT_README.md` or an equivalent document for the current project content, dataset, or client context

Prefer a human-readable top-level README over a catch-all technical dump. If README.md starts absorbing schema detail, modelling notes, or client-specific scope that makes the entrypoint harder to scan, move that detail into the more specific documentation file.

4. Prepare clean commit state
Ensure changes are grouped coherently and ready for a clean commit when the user wants to commit them.

5. Leave the repository understandable
Make sure the next logical steps, completed work, and current repo state are easy to understand for the next pass.

## Rules
Project documentation must be written in English by default.

This applies to files such as `README.md`, `TODO.md`, `CHANGELOG.md`, and documentation under `docs/`, unless the user explicitly requests another language.

Never leave `AGENTS.md`, `CHANGELOG.md`, `TODO.md`, or `ROADMAP.md` missing in a maintained repository. Create them before finishing substantial work if they do not exist.
Never leave TODO.md or CHANGELOG.md outdated.
When removing completed TODO items, first add the completed work to CHANGELOG.md in concise factual form.
Keep `CHANGELOG.md` ordered newest-first so recent work is immediately visible.

Never commit unrelated changes together.

Prefer small, clean commits over large ones.

Do not assume code should be pushed or published unless the user asks for that or the workflow explicitly requires it.

`README.md` must include a documentation index that explains the role of the other docs in the repository when such docs exist.
