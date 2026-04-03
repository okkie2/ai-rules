---
name: skill-governance-review
description: Review and update shared skills and repo-local guidance when repository structure, workspace layout, documentation setup, documentation preferences, or other durable operating conventions change. Use when the user changes folder organization, code-vs-data boundaries, README/documentation expectations, glossary conventions, CLI entrypoint conventions, or other patterns that should become the new default.
---

# Skill Governance Review

## Purpose

Prevent drift between the user's evolving repository conventions and the skills or local guidance that are supposed to enforce those conventions.

Use this skill when a user changes:
- folder organization
- code vs data boundaries
- workspace location defaults
- documentation structure or documentation preferences
- glossary or naming conventions
- CLI entrypoint conventions
- repository operating rules that should become reusable defaults
- the intended architecture of the shared skill system itself

Treat `/Users/joostokkinga/.codex/rules/skills-architecture.md` as a governing reference when the user is changing how shared skills should be grouped, scoped, promoted, or kept repo-local.

## Workflow

1. Identify the changed convention
State the durable pattern the user now wants to treat as normal.

2. Classify the scope
Decide whether the change belongs in:
- a shared skill
- top-level `AGENTS.md`
- repository documentation
- more than one of the above

When the change involves creating, revising, promoting, or demoting a skill, make an explicit placement decision first:
- global shared skill: reusable across many repositories and kinds of work
- context shared skill: shared globally, but only for one kind of project or execution context
- repo-local guidance: specific to one repository's schema, files, commands, domain, or source corpus
- temporary local exception: local for now because it is transitional, a workaround, or not yet proven as a durable shared default

State the reason briefly before updating files.

3. Review affected governance surfaces
At minimum, consider whether these should change:
- `/Users/joostokkinga/.codex/rules/skills-architecture.md`
- `repo-hygiene`
- `readme-maintenance`
- `agents-governance`
- `ubiquitous-language`
- `observability-defaults`
- `cli-entrypoint-conventions`
- repo-local `AGENTS.md`

4. Update the right layer
- Put reusable cross-repository behavior in shared skills.
- Put repository-specific conventions in `AGENTS.md`.
- Update README and other docs when the user-facing workflow changes.

5. Make the new default explicit
Do not leave the new pattern implied. Record it in the relevant skill or guidance file so future work follows it automatically.

## Rules

When a user changes folder organization or code-vs-data boundaries, explicitly evaluate whether repo hygiene guidance should now prefer that structure by default.

When a user changes documentation expectations, explicitly evaluate whether `repo-hygiene` or `readme-maintenance` should be updated.

When a user changes documentation expectations around product-versus-project framing, explicitly evaluate whether the new default should be:
- top-level `README.md` focused on the reusable tool or product
- project-specific or client-specific content moved to `PROJECT_README.md` or an equivalent content document

When a user changes naming or concept boundaries, explicitly evaluate whether `ubiquitous-language` or the repository glossary should change.

When a user changes CLI entrypoint or onboarding conventions, explicitly evaluate whether `cli-entrypoint-conventions`, `readme-maintenance`, or repo-local `AGENTS.md` should change.

When a user changes repository operating conventions, explicitly evaluate whether `AGENTS.md` or `agents-governance` should change.

When a user changes how shared skills should be categorized or when a pattern should be global versus repo-local, explicitly evaluate whether `/Users/joostokkinga/.codex/rules/skills-architecture.md` should change.

Do not update shared skills for repo-local exceptions only.

Do not leave governance drift unaddressed after a durable convention change.

## Output Expectations

When this skill is used, Codex should:
- name the convention that changed
- state which governance surfaces were reviewed
- update the relevant shared skills or repo-local guidance when appropriate
- explain what became the new default and where it was recorded
