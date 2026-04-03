---
name: parallel-git-workflow
description: Coordinate safe parallel git work across multiple agents in one repository. Use when several agents are active at the same time, when work should be split across branches or worktrees, when an integration branch may be needed, or when the human operator needs a clear branch, sync, commit, and PR strategy for multi-agent execution.
metadata:
  short-description: Coordinate safe parallel multi-agent git work
---

# Parallel Git Workflow

Use this skill when multiple AI agents may work in parallel on the same repository under one human coordinator.

Before deciding that a request belongs here, follow `/Users/joostokkinga/.codex/rules/skills-architecture.md`: this is a shared `workflows` skill because it defines a reusable coordination routine across repositories rather than one repository's local exception.

## Objective

Keep parallel multi-agent git work safe, reviewable, and low-conflict.

Optimize for:

- one human coordinating several agents
- clear branch ownership
- disjoint write scopes where practical
- small logical commits
- predictable integration
- avoiding conflicts before they happen

## Core Rules

- One agent per branch by default.
- Do not let multiple agents commit to the same branch unless the human coordinator explicitly intends that and the write scope is tightly controlled.
- Split work by file, layer, or responsibility before splitting it by speed.
- Prefer conflict avoidance over conflict resolution.
- Open a draft PR early for non-trivial work when repository workflow and tools support it.
- Keep commits small, logical, and readable.
- Merge to `main` only when the branch is actually ready.
- The human coordinator owns integration decisions.

## Default Workflow

1. Decide whether the work is actually parallelizable.
2. Split the work into disjoint responsibilities.
3. Give each agent its own branch by default.
4. Use separate worktrees when parallel local checkouts help.
5. Keep each branch current enough to avoid stale drift.
6. Integrate through reviewable commits or an integration branch when the feature spans multiple agent branches.
7. Merge to `main` only after the integration path is stable.

## Branch Strategy

### Default

Use one branch per agent and one coherent task per branch.

Good default branch naming:

- `feat/export-xlsx-agent-a`
- `fix/auth-timeout-agent-b`
- `docs/model-rules-agent-c`
- `refactor/pbs-query-split-agent-a`

If issue IDs exist, prefer including them:

- `123-feat-export-xlsx-agent-a`
- `456-fix-login-timeout-agent-b`

### Shared Branches

Treat shared branches as exceptional.

Only allow multiple agents on one branch when:

- the human coordinator explicitly wants it
- the write scope is extremely small
- ownership boundaries are still clear
- the risk of branch drift is lower than the cost of extra integration

If two agents need the same branch, stop and re-check whether the work should instead be split into:

- separate branches plus later integration
- one agent owning the branch while others stay read-only
- a short-lived integration branch

## Task Decomposition

Prefer splitting work by:

- file ownership
- layer or module
- API versus UI
- schema versus application logic
- implementation versus verification
- docs versus code

Good split:

- agent A: `db/` migration and schema docs
- agent B: `app.py` integration
- agent C: `templates/` UI changes
- agent D: BDD or regression verification

Bad split:

- two agents editing the same template and same route handler at the same time
- one agent refactoring while another adds features in the same files
- parallel edits in the same branch without explicit ownership

## Issue And Task Strategy

For non-trivial work, prefer one issue or task per branch-sized unit of work.

Use a lighter path when the change is trivial, isolated, and unlikely to need separate review or tracking.

A task is non-trivial when it involves one or more of:

- multiple files or layers
- a user-visible workflow change
- a schema or migration step
- integration risk
- cross-agent coordination
- substantial verification

## Worktree Strategy

Use `git worktree` when one human is coordinating multiple active branches locally.

Good use cases:

- two or more agents need separate local checkouts at the same time
- you need to inspect or test multiple branches side by side
- you want to keep integration work separate from feature work

Benefits:

- avoids constant checkout switching
- reduces accidental commits to the wrong branch
- makes branch ownership more visible

## Sync Strategy

### Refresh From Main

Refresh a branch from `main` when:

- the branch has been open long enough for drift to matter
- another branch changed shared code the branch depends on
- you are about to integrate or open a serious review

### Rebase Versus Merge

Prefer rebase when:

- the branch is personal to one agent
- you want a clean reviewable history
- the branch has not yet become a shared integration surface

Prefer merge when:

- preserving branch history is useful
- the branch is already acting as an integration point
- rewriting history would create confusion for other active agents or reviewers

Do not rebase a branch that other agents are actively committing to unless the human coordinator explicitly owns that rewrite.

## Integration Branch Strategy

Use an integration branch when:

- several agent branches belong to the same larger feature
- they are individually reviewable but need combined testing before `main`
- you want to keep `main` clean while validating the combined result

Example integration branch names:

- `integration/export-xlsx`
- `integration/auth-redesign`
- `integration/plateau-02-import`

The integration branch should have one owner: usually the human coordinator or one explicitly designated integration agent.

Do not let every agent merge into the integration branch casually.

## Commit Strategy

Use small logical commits with one purpose each.

Good commit messages:

- `feat: add xlsx tree export writer`
- `fix: keep auth timeout banner visible after refresh`
- `docs: clarify relation ladder and skip-level rule`
- `test: add bdd coverage for export tab layout`

Bad commit messages:

- `changes`
- `wip`
- `fix stuff`
- `updates`

A commit should be understandable without reading the whole branch history.

## PR Strategy

For non-trivial branches, prefer opening a draft PR early when the repository workflow supports it.

Use the PR to:

- make scope visible
- surface integration risk early
- keep review boundaries clear

Keep PR scope reviewable. If a branch is becoming too broad, split it or move part of the work behind a dedicated integration branch.

Merge to `main` only when:

- the branch is coherent
- conflicts are resolved
- the intended verification has run
- the result is understandable to reviewers

## Decision Tree

Use this quick decision tree before parallelizing:

1. Same feature?
- no -> use separate branches
- yes -> continue

2. Same files or same layer?
- no -> use one branch per agent
- yes -> continue

3. Can the work be split by ownership or sequence?
- yes -> split by responsibility and keep separate branches
- no -> use one owner branch and keep others read-only or serial

4. Are multiple branch results required before merging to `main`?
- yes -> use an integration branch
- no -> merge branches independently when ready

5. Is the branch private to one agent?
- yes -> prefer rebase for keeping current
- no -> prefer merge and avoid history rewrites

## Anti-Patterns

Avoid:

- multiple agents committing to the same branch by default
- parallel edits in the same files without ownership boundaries
- long-lived stale branches with no refresh plan
- opening one giant PR for many loosely related changes
- accidental integration in `main`
- using speed as the only reason to parallelize work

## Output Expectations

When this skill is used, Codex should:

- propose the branch and ownership plan first
- identify likely conflict zones before editing begins
- recommend when worktrees help
- state whether an integration branch is needed
- suggest sensible branch names, commit shapes, and PR scope
- keep the human coordinator in charge of integration decisions
