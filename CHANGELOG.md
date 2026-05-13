# CHANGELOG

## 2026-05-13

- Clarified that `skill-governance-review` only handles README split decisions when the split itself is changing; routine README structure work stays with `readme-maintenance`.
- Tightened the boundary between `readme-maintenance` and `repo-hygiene` so README structure stays with the README skill while changelog and TODO hygiene stays with repo hygiene.
- Completed the last overlap cleanup pass for the governance cluster by sharpening the boundaries between `agents-governance`, `skill-governance-review`, `repo-hygiene`, and `repo-health-review`, then synced the updated skills to the live runtime.
- Tightened `repo-hygiene` so it no longer owns high-level README split decisions; those now sit with `readme-maintenance` or `skill-governance-review`.
- Normalized `metadata.short-description` across the curated shared skill set so the skill list is easier to scan and trigger.
- Added `rules/skills-cleanup-plan.md` and linked it from the repo entrypoint to keep the remaining cleanup work discoverable.
- Recorded the first cleanup pass for runtime-local exception candidates in `rules/skills-inventory.md` so they stay separate from the curated shared set.
- Moved the runtime-local exception skills out of the active `~/.codex/skills` load path and into `~/.codex/archive/skills/local-exceptions/`.
- Tightened the governance skill boundaries so `agents-governance`, `skill-governance-review`, `repo-hygiene`, `repo-health-review`, `readme-maintenance`, and `todo-roadmap-prioritization` have clearer triggers and less overlap.
- Reworded the curated skill inventory so the rationale text matches the sharpened governance and trigger boundaries.
- Promoted `devops-concept-feedback` into the curated shared skill set so technical concept coaching is distinct from generic prompt review.
- Tightened the remaining governance overlap cluster so `agents-governance`, `skill-governance-review`, `repo-hygiene`, and `repo-health-review` have clearer boundaries.

## 2026-04-03

- Updated the shared `readme-maintenance` skill to include brief explanations of main repository documents in `README.md` when that improves document discoverability.
- Split standing repository rules out of `TODO.md` into a dedicated `DOALWAYS.md` file.
- Renamed `USERMANUAL.md` to `MANUAL.md` and updated repository links and guidance to match.
- Added the shared `application-development` context skill as the first generic coding context in `ai-rules`.
- Clarified in the manual and backlog that coding contexts are the most important missing shared context family.
- Added `MANUAL.md` with setup guidance, sync workflow explanation, and a skill-by-skill overview with example prompts.
- Updated `README.md` to point readers to the manual and document index.
- Added sync scripts for deploying curated shared skills and rules between `ai-rules` and the live Codex runtime.
- Added the shared `ai-rules-sync` workflow skill to govern repo-to-runtime and recovery sync behavior.
- Initialized `ai-rules` as the versioned source-of-truth repository for curated shared AI-agent skills and governance notes.
- Copied the current curated shared skills and shared rules from the live Codex runtime into the repository.
