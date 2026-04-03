# CHANGELOG

## 2026-04-03

- Updated the shared `readme-maintenance` skill to include brief explanations of main repository documents in `README.md` when that improves document discoverability.
- Split standing repository rules out of `TODO.md` into a dedicated `DOALWAYS.md` file.
- Added the shared `application-development` context skill as the first generic coding context in `ai-rules`.
- Clarified in the manual and backlog that coding contexts are the most important missing shared context family.
- Added `USERMANUAL.md` with setup guidance, sync workflow explanation, and a skill-by-skill overview with example prompts.
- Updated `README.md` to point readers to the manual and document index.
- Added sync scripts for deploying curated shared skills and rules between `ai-rules` and the live Codex runtime.
- Added the shared `ai-rules-sync` workflow skill to govern repo-to-runtime and recovery sync behavior.
- Initialized `ai-rules` as the versioned source-of-truth repository for curated shared AI-agent skills and governance notes.
- Copied the current curated shared skills and shared rules from the live Codex runtime into the repository.
