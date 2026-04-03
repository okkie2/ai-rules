---
name: readme-maintenance
description: Keep README.md accurate, complete, and structurally consistent after repository changes. Use when functionality, setup, usage, dependencies, outputs, limitations, or project structure have changed and the README should be updated accordingly.
---

# README Maintenance

## Purpose

Keep README.md useful as the main human entrypoint to a repository.

A good README should help a new reader understand what the repository is, why it exists, what it can do today, and where to go for deeper detail.

## Default shape

README.md should usually cover these concerns when they are relevant:

- what the project or tool is
- who it is for
- what problem it solves
- why this approach is a good fit
- what it can do today
- how to start using it quickly
- where to read more
- what the main current limits are
- what the near-term direction is

These concerns do not need to map to a rigid fixed section list.
Prefer a clear narrative structure over a checklist of inherited headings.

## Recommended flow

When there is no better repository-specific pattern, prefer this order:

1. title
2. short opening that explains the tool or repository in plain language
3. why it exists / who it is for / what problem it solves
4. what it can do today
5. quick start
6. repository guide to deeper docs
7. current limits and status
8. roadmap or next direction
9. licence, if relevant

Adjust the structure when a different flow is more readable.
Do not preserve a section just because an older template expected it.

## Rules

README.md must be written in English by default, unless the user explicitly requests another language.

Keep Quick Start near the top.

Keep instructions copy-pasteable.

Do not leave empty sections.

Top-level README.md should be human-readable first, not a schema dump.
Keep top-level README.md narrative and readable; do not let it drift into a rigid checklist-shaped document unless the repository truly needs that format.

README.md should answer these questions clearly and early when they matter:
- who is this for
- what problem does it solve
- why this approach is a good fit
- what it can do today
- how it works at a high level
- where to read more

README.md should include a repository guide that points readers to the deeper documents for things like:
- database schema / ERD
- stack and runtime details
- installation and operation
- end-user manual or UI documentation
- roadmap
- FAQ / glossary / project-specific context

When a repository has several standing top-level documents, README.md should briefly explain the role of each main document.
Typical examples include:
- `MANUAL.md`
- `DOALWAYS.md`
- `TODO.md`
- `ROADMAP.md`
- `CHANGELOG.md`

Keep those explanations short and orienting.
The goal is discoverability, not duplicating the content of those documents inside README.md.

Keep top-level README.md focused on the reusable tool, product, or repository itself.
Do not lead with client-specific or project-specific framing in an open or reusable repository unless the repository is explicitly a client delivery artifact.

When a repository contains both a reusable tool and project-specific or client-specific content, prefer this split:
- `README.md` for the tool or product
- `PROJECT_README.md` or an equivalent project-content document for the current source corpus, modelling scope, dataset, or client context

Move deep schema notes, modelling rules, or project-specific source descriptions out of README.md and into more specific documentation files whenever that improves readability.

When a repository has both an end-user manual and technical UI documentation, prefer this split:
- `MANUAL.md` for task-oriented end-user guidance
- a technical document such as `docs/web-app.md` for UI behavior, edit/read-only semantics, and implementation-facing interaction detail

Keep the startup or first-use path obvious near the top of the end-user manual when such a manual exists.

When `TODO.md` exists, derive the README roadmap from it, but summarize only themes and direction.
Do not copy raw task lists.

Update only affected sections, but ensure the full document stays consistent.
