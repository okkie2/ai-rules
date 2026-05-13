# Skills Cleanup Plan

## Purpose

Make the curated skill set easier to understand, easier to trigger correctly, and easier to maintain.

This plan covers the curated shared skills in `skills/` and the governance notes that describe them.

## What Changed

The current set has four patterns that need cleanup:

1. some skills encode repo-local or workspace-local rules
2. several governance skills overlap in scope
3. prompt/writing skills are close enough to blur at the boundary
4. metadata is inconsistent, especially `short-description`

First-pass status:

- the runtime-local exception candidates have been identified
- they have been moved out of the active `~/.codex/skills` load path
- they are archived under `~/.codex/archive/skills/local-exceptions/`

## Suggested Place

Keep this plan in `rules/skills-cleanup-plan.md`.

Reason:

- it is a durable governance note, not a transient task list
- it belongs beside `skills-architecture.md` and `skills-inventory.md`
- it is broader than `TODO.md` but more specific than `README.md`

## Cleanup Goals

- keep shared skills truly reusable
- push repo-specific rules back into repo-local guidance
- sharpen trigger language so skills do not compete with each other
- normalize metadata so the skill list is scannable
- keep the inventory aligned with actual category boundaries

## Workstreams

### 1. Demote repo-local exceptions

Review skills that currently carry one-repo or one-workspace assumptions.

Move or rehome them if they are really local guidance rather than reusable behavior.

Candidates:

- `offgridos-single-local-instance`
- `sqlite-neon-sync-safety`
- `inzagerecht-chat-log`
- `git-dual-push` if the intent remains tied to one exact remote pairing

Current classification:

- these have been moved out of the active runtime `~/.codex/skills/` set
- they are now archived as runtime-local exceptions under `~/.codex/archive/skills/local-exceptions/`
- they should be treated as repo-local guidance or a future deliberate promotion candidate, not as curated shared skills

Decision rule:

- reusable across multiple repos or contexts -> keep as shared skill
- specific to one repo, source set, or workspace -> move to repo-local guidance

### 2. Sharpen governance boundaries

Reduce overlap between nearby governance skills by making their triggers more distinct.

Focus on these pairs or clusters:

- `agents-governance` vs `skill-governance-review`
- `repo-hygiene` vs `repo-health-review`
- `readme-maintenance` vs `repo-hygiene`
- `todo-roadmap-prioritization` vs `repo-hygiene`

Goal:

- each skill should have a clearly different trigger and output
- no skill should feel like a generic catch-all for documentation maintenance

Status:

- completed for the current overlap cluster
- `agents-governance` now focuses on where repository instructions belong
- `skill-governance-review` now focuses on durable convention changes and shared-vs-local placement
- `skill-governance-review` only handles README split decisions when the split itself is changing
- `repo-hygiene` now focuses on changelog, TODO, and commit hygiene without owning README structure decisions
- `repo-health-review` now focuses on broader coherence reviews after meaningful change waves

### 3. Separate prompt help from concept coaching

Keep the prompt-review and concept-feedback skills distinct, but make the boundary explicit.

Suggested distinction:

- `prompt-review-and-improvement`: sharpen a user prompt before execution
- `devops-concept-feedback`: correct terminology and DevOps mental models

If they still feel too close after review, merge the overlap into one broader prompt-feedback skill and keep the narrower one as an alias or lightweight variant.

Status:

- completed in the first cleanup pass
- `prompt-review-and-improvement` now owns generic prompt sharpening
- `devops-concept-feedback` now owns DevOps terminology and concept coaching

### 4. Normalize metadata

Add `metadata.short-description` to curated shared skills where it is missing.

Keep `description` concise and trigger-focused.

Preferred shape:

- `name`: stable skill name
- `description`: one clear sentence about when to use it
- `metadata.short-description`: short browseable UI label

### 5. Reclassify the inventory

After the skill edits, update `rules/skills-inventory.md` so the taxonomy reflects the current set.

That inventory should stay aligned with:

- actual triggers
- actual scope
- actual category boundaries

## Suggested Order

1. fix the repo-local exceptions first
2. tighten the overlapping governance skills
3. normalize metadata
4. update `skills-inventory.md`
5. do a final read-through of `skills-architecture.md`

## Exit Criteria

The cleanup is done when:

- shared skills are clearly reusable
- repo-local exceptions are no longer living in the shared set
- overlapping skills have distinct triggers
- curated skills have consistent metadata
- the inventory and architecture notes match the final taxonomy
