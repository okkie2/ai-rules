---
name: agents-governance
description: Create, review, and maintain AGENTS.md guidance for a repository. Use when Codex should decide what belongs in shared skills versus repo-local AGENTS.md, create or slim down AGENTS.md files, add deeper scoped AGENTS.md files for subdirectories, or keep repository instructions aligned with current architecture, tooling, and conventions.
---

# Agents Governance

## Purpose

Keep repository instruction files clear, local, and maintainable.

Use this skill to manage `AGENTS.md` files and the boundary between reusable shared skills and repo-specific guidance.

## Workflow

1. Identify scope
Decide whether the requested instruction belongs at:
- shared skill level
- top-level `AGENTS.md`
- deeper scoped `AGENTS.md` for a subdirectory

2. Start new repositories from the standard skeleton
When creating a new repository or initializing its instruction file, create a top-level `AGENTS.md` from the standard baseline structure.
Also create top-level `CHANGELOG.md`, `TODO.md`, and `ROADMAP.md` as part of that baseline so repository hygiene starts from day one.

3. Separate reusable from local
Move durable cross-project behavior into shared skills.
Keep repo-specific details in `AGENTS.md`.

4. Keep `AGENTS.md` thin
Prefer short, local, factual instructions over long policy documents.

5. Use nested `AGENTS.md` only when needed
Add a deeper `AGENTS.md` only when a subdirectory has genuinely different rules, constraints, or workflows.

6. Update instructions with the repo
When architecture, tooling, file layout, testing approach, naming conventions, or operating constraints change, update the relevant `AGENTS.md` files.

## Standard Top-Level Structure

The top-level `AGENTS.md` for a new repository should include these sections:
- `Scope`
- `Operating Model`
- `Repository Context`
- `Repository-Specific Rules`
- `Local Exceptions`

The `Operating Model` section should state that the repository relies on shared cross-project guidance and that `AGENTS.md` should stay focused on repository-specific rules and exceptions.

## Rules

When initializing repository governance, treat `AGENTS.md`, `CHANGELOG.md`, `TODO.md`, and `ROADMAP.md` as the default top-level governance set unless there is an explicit reason not to.

Treat these as universal required concerns for coding repositories, even when they do not each need a dedicated file:
- architecture
- stack and runtime choice
- testing and quality approach
- deployment or operations, when applicable
- canonical terminology and ubiquitous language

Require those concerns to be documented somewhere appropriate in the repository, but do not force one universal filename for each concern. Small repositories may cover them in `README.md`, while larger repositories may use dedicated files under `docs/` or other clearly named locations.

`AGENTS.md` should contain repository-specific context such as:
- stack and framework choices
- local file paths and directories
- UI system choices
- testing commands specific to the repo
- deployment or runtime constraints
- domain-specific local exceptions

Shared skills should contain durable reusable behaviors such as:
- ubiquitous language discipline
- observability expectations
- change verification discipline
- commit discipline
- documentation maintenance patterns
- delivery workflow patterns

Do not duplicate shared skill guidance in `AGENTS.md` unless the repository needs a local override or clarification.

Do not put README maintenance, changelog maintenance, or commit-message rules in `AGENTS.md` unless the repository has a special exception.

Prefer one clear top-level `AGENTS.md` over many nested files.
Introduce nested `AGENTS.md` only when local differences are real and sustained.

When a repository combines a reusable tool with project-specific or client-specific content, keep that durable README split out of `AGENTS.md` unless the repository needs a local exception. The default should live in shared README-maintenance and repo-hygiene guidance; `AGENTS.md` should only record the local documentation roles when that split exists in the repo.

When slimming down an existing `AGENTS.md`:
- remove duplicated generic guidance
- preserve repo-specific constraints
- keep scope statements explicit
- restore the standard top-level structure when practical

## Output Expectations

When this skill is used, Codex should:
- explain what belongs in shared skills versus `AGENTS.md`
- create or revise the relevant `AGENTS.md` files
- use the standard top-level structure for new repositories
- keep instructions concise and scoped
- preserve any intentional local exceptions
