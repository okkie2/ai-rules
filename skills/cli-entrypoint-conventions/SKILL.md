---
name: cli-entrypoint-conventions
description: Standardize local entrypoints for CLI repositories. Use when building or changing a CLI app, onboarding flow, launcher script, or interactive command surface and the repo should provide a discoverable menu that opens by typing `menu` from the project root without hijacking shell behavior outside that repo.
---

# CLI Entrypoint Conventions

## Purpose

Make CLI repositories easy to discover and operate locally.

Use this skill when a repository's primary interface is a CLI and the local developer workflow should include an interactive menu.

## Workflow

1. Confirm the repo is a CLI app
Apply this skill when the repository exposes user-facing commands or scripts rather than only library APIs.

2. Provide a repo-local menu launcher
Create a repo-local launcher such as `./menu` that starts the interactive menu without requiring packaging or global install success.

3. Make `menu` available from the repo root only
If shell setup is needed, prefer a directory-sensitive alias or shell function so typing `menu` works from the project root and fails clearly outside it.

4. Keep the CLI menu useful
The menu should expose the current supported workflows, not placeholder features. It should be a practical entrypoint for real tasks.

5. Document the entrypoint
Update `README.md` so the repo explains:
- how to start the menu
- whether `menu` requires shell setup
- the fallback command if shell setup is unavailable

6. Verify the behavior
Check that:
- `./menu` works from the repo root
- `menu` works from the repo root when the documented shell setup is loaded
- `menu` does not silently redirect from unrelated directories unless the user explicitly wants that behavior

## Rules

Prefer a repo-local launcher over packaging-only entrypoints.

Do not rely on `pip install -e .` as the only way to access the menu.

Do not make `menu` a global command that changes directory into a repo from anywhere unless the user explicitly asks for that behavior.

When the menu command depends on shell setup, keep the setup minimal and document it in the repo.

When a repository has a stronger local rule, record that in the repo's `AGENTS.md`.

Use tests or scripted verification for menu rendering or launcher behavior when practical.

## Output Expectations

When this skill is used, Codex should:
- create or maintain a repo-local menu launcher
- ensure `menu` is available from the repo root under the documented local setup
- document the behavior in `README.md`
- keep shell behavior scoped and unsurprising
- update repo-local guidance if the repository has a specific menu convention
