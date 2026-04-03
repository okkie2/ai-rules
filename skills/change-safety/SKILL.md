---
name: change-safety
description: Apply disciplined change verification for UI and logic work. Use when Codex makes or reviews behavioral changes and should choose the right automated tests, add missing regression coverage where practical, run relevant checks, and report what was verified and what residual risk remains.
---

# Change Safety

## Purpose

Keep behavior changes safe by pairing implementation with relevant automated verification.

Use this skill whenever code changes affect UI behavior, logic, workflows, validation, or other user-visible behavior.

## Workflow

1. Identify the change surface
Classify the change:
- pure logic
- UI rendering or interaction
- integration boundary
- critical user workflow
- refactor with expected behavior preservation

2. Choose the smallest credible automated check
Prefer the narrowest test scope that meaningfully verifies the change.

Typical order:
- unit tests for pure logic
- component or integration tests for UI behavior
- end-to-end or workflow tests for critical flows
- targeted regression test for a reproduced bug

3. Add missing coverage when practical
If the changed area lacks useful automated coverage, add the smallest useful regression test before or alongside the code change.

4. Run relevant checks
Run the relevant automated tests before considering the task complete.
Broaden the scope when targeted checks reveal wider risk.

For Next.js projects with no automated test suite, the minimum check is:
- Stop the dev server if running
- Run `npm run dev` and confirm it starts without errors
- Instruct the user to hard-refresh the browser (Cmd+Shift+R) to verify the change

5. Report verification clearly
State what was run, what passed, what failed, what could not be run, and any residual risk.

## Rules

Do not finish a UI or logic change without running relevant automated checks, unless the environment makes that impossible.

If no suitable automated test exists for the changed behavior, add one when practical.

Prefer behavior-focused tests over implementation-detail tests.

For refactors, verify preserved behavior with existing or added regression coverage.

Do not ignore failing tests that are relevant to the changed area.

If automated verification cannot be completed, say so explicitly and describe the remaining risk.

Do not let this skill take over responsibilities owned by other skills:
- commit messages belong to `commit-discipline`
- README updates belong to `readme-maintenance`
- TODO and CHANGELOG updates belong to `repo-hygiene`

## Heuristics

Use unit tests when changing:
- parsing
- transformations
- validation rules
- domain logic
- utility functions

Use component or integration tests when changing:
- form behavior
- conditional rendering
- validation feedback
- navigation behavior
- language switching
- user interactions

Use end-to-end or workflow tests when changing:
- critical user journeys
- multi-step flows
- auth-sensitive behavior
- cross-page workflows
- interactions with real external boundaries when test infrastructure exists

## Output Expectations

When this skill is used, Codex should:
- describe the relevant verification approach
- add or update regression coverage where needed
- run the relevant automated checks
- summarize verification results and residual risk
