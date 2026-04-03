---
name: delivery-routine
description: Prepare and execute the repository's delivery steps after a logical unit of work is complete. Use when Codex should turn a clean local change set into a delivered change by checking readiness, confirming commit state, pushing branches, preparing pull requests, or updating release-facing delivery artifacts according to the repository's workflow.
---

# Delivery Routine

## Purpose

Move a completed logical unit of work from clean local state to delivered repository state.

Use this skill after implementation, verification, and local repo hygiene are already in good shape.

## Workflow

1. Check readiness
Confirm the work is in a clean enough state to deliver:
- relevant changes are complete
- verification has run
- documentation is updated where needed
- commit boundaries are coherent

2. Confirm branch and commit state
Check the current branch, staged and unstaged changes, and whether commits already exist or still need to be created.

3. Complete delivery steps for the repository
Follow the repository's delivery path, which may include:
- creating or finalizing commits
- pushing the branch
- preparing a pull request
- updating release-facing notes or status artifacts

4. Report delivery outcome
State what was delivered, what commands were run, and any remaining manual follow-up.

## Rules

Do not assume a repository should be pushed, published, or opened as a pull request unless the user asks for delivery work or the repository workflow explicitly requires it.

Follow the repository's existing branching, PR, and release conventions instead of inventing new ones.

If commit creation is needed, use `commit-discipline` for commit structure and messages.

If README, TODO, or CHANGELOG maintenance is needed before delivery, finish that work first.

If verification has not been completed for behavior changes, stop and use the relevant verification workflow before delivery.

Do not deliver unrelated local changes together.

When delivery cannot be completed, explain the blocker clearly and leave the repo in a safe state.

## Output Expectations

When this skill is used, Codex should:
- confirm delivery readiness
- perform the repository's delivery steps when requested
- report what was delivered and what remains
- avoid mixing delivery with unrelated cleanup or implementation work
