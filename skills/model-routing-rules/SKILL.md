---
name: model-routing-rules
description: Route coding tasks to the cheapest viable model and reasoning effort while preserving quality. Use when planning or executing work where cost, speed, and model choice matter, including edit-heavy tasks, refactors, ambiguous design decisions, or any request to optimize model usage.
---

# Model Routing Rules

Classify the task before starting implementation, then choose the least expensive route that can succeed in one pass.

## 1) Classify The Task

- Mechanical: deterministic edits such as formatting, renaming, tiny fixes, repetitive updates, or straightforward test updates.
- Structural: multi-file refactors, reorganizing modules, introducing a new pattern across related files, or medium-risk behavior changes.
- Conceptual: architecture, unclear requirements, tradeoff-heavy design, high ambiguity, or high-blast-radius decisions.

If uncertain between two classes, start with the cheaper class and escalate only on concrete failure signals.

## 2) Select Model And Reasoning

- Mechanical: `gpt-5.1-codex-mini` with `low` reasoning.
- Structural: `gpt-5.3-codex` with `medium` reasoning.
- Conceptual: `gpt-5.4` with `medium` reasoning.
- Conceptual plus significant ambiguity or safety risk: `gpt-5.4` with `high` reasoning.

Default rule: prefer the cheapest viable option first.

## 3) Escalation Triggers

Escalate only when one or more triggers occurs:

- Ambiguity remains after one focused clarification attempt.
- Two implementation attempts fail for logic/design reasons.
- Tests repeatedly fail due to design mismatch rather than syntax mistakes.
- Change has high blast radius or safety/compliance implications.
- Review reveals non-trivial reasoning gaps.

Use at most one escalation per task unless a new, clearly different risk appears.

## 4) De-Escalation Rule

After a stable plan is produced by the stronger model:

- Return execution (edits, wiring, deterministic fixes, routine test loops) to `gpt-5.1-codex-mini`.
- Keep the stronger model only for unresolved decisions.

This keeps quality where needed and cost low everywhere else.

## 5) Execution Pattern

Use this loop:

1. Classify task.
2. Pick model and effort.
3. Produce one high-quality reasoning artifact: decision, plan, or architecture slice.
4. Execute implementation on mini where feasible.
5. Verify with tests/review checks.
6. Escalate only if a trigger is hit.

## 6) Delegation And Parallelism

When sub-agents are available and the user has allowed delegation, use them to make the routing policy operational rather than purely descriptive.

- Keep the immediate blocking task local when the next step depends on it right away.
- Delegate bounded, non-overlapping subtasks such as repo scans, targeted code edits, or sidecar verification.
- Prefer smaller/cheaper sub-agents for mechanical scans, repetitive edits, or parallel test runs.
- Use stronger sub-agents only for clearly scoped structural or conceptual subtasks that benefit from deeper reasoning.
- Parallelize verification when useful: one agent can implement while another runs relevant BDD/Cucumber or other regression checks and reports failures.
- Do not delegate vague, highly coupled, or cross-cutting work that the coordinating agent must integrate tightly.

Typical pattern:

1. Keep classification and the highest-risk decision local.
2. Spawn bounded workers for non-blocking sidecar work.
3. Continue local integration while delegated work runs.
4. Review the returned result quickly and only then integrate or refine.
5. De-escalate subsequent deterministic follow-up back to the cheapest viable model.

## 7) Output Contract

When reporting route choice, always include:

- Task class.
- Selected model and reasoning effort.
- Why cheaper options were sufficient, or why escalation was necessary.
- Whether execution has de-escalated back to mini.

Keep this explanation to 2-5 lines unless the user asks for depth.
